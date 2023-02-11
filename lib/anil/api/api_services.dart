import 'dart:convert';

import 'package:api_userlist/anil/models/login_model.dart';
import 'package:api_userlist/anil/models/signup_model.dart';
import 'package:http/http.dart';

class ApiServices {
  static Future<LoginModel?> loginApi(
      {required String email, required String password}) async {
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login",),
        body: {
          "email": email,
          "password": password
        }
        );
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    } catch (e) {
      return null;
    }
  }
  static Future<SignInModel?> signInApi() async {
    try {
      Response response = await get(
        Uri.parse("https://reqres.in/api/users?page=2",)
        );
      SignInModel signInModel = SignInModel.fromJson(jsonDecode(response.body));
      return signInModel;
    } catch (e) {
      return null;
    }
  }

  
}
