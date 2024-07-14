import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  static const String TK = 'tk';
  static const String USERID = 'id';
  static const String PIN = 'pin';
  static const String ONBOARDING = 'onboarding';

  String? currentVersion;

  static SharedPreferences? secureStorage;

  static Future<SharedPreferences> getInstance() async {
    secureStorage ??= await SharedPreferences.getInstance();
    return secureStorage!;
  }

  dynamic readFromStorage(String key) {
    final value = secureStorage!.get(key);
    return value;
  }

  void writeToStorage<T>(String key, T content) async {
    if (content is String) {
      await secureStorage!.setString(key, content);
    }
    if (content is bool) {
      await secureStorage!.setBool(key, content);
    }
    if (content is int) {
      await secureStorage!.setInt(key, content);
    }
    if (content is double) {
      await secureStorage!.setDouble(key, content);
    }
    if (content is List<String>) {
      await secureStorage!.setStringList(key, content);
    }
  }

  String? _token;
  String? _userId = '';
  String? _pin;

  void setToken(String token) {
    _token = token;
    writeToStorage(TK, token);
  }

  String? get getUserToken => readFromStorage(TK) ?? _token;

  void setUserID(String id) {
    _userId = id;
    writeToStorage(USERID, id);
  }

  String get getUserID => readFromStorage(USERID) ?? _userId;

  void setPin(String pin) {
    _pin = pin;
    writeToStorage(PIN, pin);
  }

  String? get getUserPin => readFromStorage(PIN) ?? _pin;

  void setOnboarding(bool s) {
    writeToStorage(ONBOARDING, s);
  }

  bool? get getOnboarding => readFromStorage(ONBOARDING) ?? false;

  Future<void> deleteAll() async {
    _userId = null;
    _token = null;
    _pin = null;

    await secureStorage!.remove(USERID);
    await secureStorage!.remove(PIN);
    await secureStorage!.remove(TK);
  }
}
