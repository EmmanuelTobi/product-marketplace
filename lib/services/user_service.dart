import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'package:marketplace/services/api_helper.dart';
import 'package:marketplace/services/api_routes.dart';
import 'package:marketplace/ui/auth/models/user_model.dart';

class UserService {

  UserModel? userModel;

  Future<void> fetchUserData() async {

    var response = await http.get(Uri.parse('${APIRoutes.user}/1'),
        headers: APIHelper().requestHeaders());

    final json = JSON.jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {

      userModel = UserModel.fromJson(json);

    } else {
      var error = json["message"];
      throw Exception(error);
    }
  }

}