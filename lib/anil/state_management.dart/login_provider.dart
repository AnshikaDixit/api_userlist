import 'package:api_userlist/anil/api/api_services.dart';
import 'package:api_userlist/anil/models/login_model.dart';
import 'package:api_userlist/screens/get_api.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  LoginModel? loginModel;
  bool isLoggingIn = false;
  

  void login(BuildContext context,
      {required String email, required String password}) async {
    isLoggingIn = true;
    notifyListeners();
    loginModel = await ApiServices.loginApi(email: email, password: password);
    isLoggingIn = false;
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  
}
