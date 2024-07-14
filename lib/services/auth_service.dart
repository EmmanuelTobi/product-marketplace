import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'package:marketplace/services/api_helper.dart';
import 'package:marketplace/services/api_routes.dart';
import 'package:marketplace/services/persistence_service.dart';
import 'package:marketplace/util/locator_setup.dart';

class AuthService {
  final persistService = serviceLocator<PersistenceService>();

  Future createUser({Map<String, dynamic>? data, bool? isAuthFromProvider = false}) async {
    final jsonData = JSON.json.encode(data);

    var response = await http.post(Uri.parse(APIRoutes.user),
        headers: APIHelper().requestHeaders(), body: jsonData);
    final json = JSON.jsonDecode(response.body);

    print(json.toString());
    print(APIHelper().requestHeaders());

    if (response.statusCode == 200 || response.statusCode == 201) {

      await loginUser(
          email: data!['username'],
          password: data['password'],
      );

    } else {
      var error = json["message"];
      throw Exception(error);
    }
  }

  Future<void> loginUser({String? email, String? password,}) async {

    final jsonData = JSON.json.encode({
      "username": "mor_2314",
      "password": "83r5^_",
    });

    print(jsonData.toString());

    var response = await http.post(Uri.parse(APIRoutes.loginUser),
        headers: APIHelper().requestHeaders(), body: jsonData);
    final json = JSON.jsonDecode(response.body);

    print(json.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {

      persistService.setToken(json["token"]);

    } else {
      var error = json["message"];
      throw Exception(error);
    }
  }

}