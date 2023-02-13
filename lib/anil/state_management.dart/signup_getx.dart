import 'package:api_userlist/anil/models/signup_model.dart';
import 'package:api_userlist/screens/get_api.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  SignInModel? signInModel;
  var isLoggingIn = false.obs;

  // @override
  // Future<void> onInIt() async {
  //   super.onInit();
  //   fetchData();
  // }

  fetchData() async {
    try {
      isLoggingIn(true);
      http.Response response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        signInModel = SignInModel.fromJson(result);
        print('api called');
        Get.to(() => const Home());
      } else {
        print('error fecthing data');
      }
    } catch (e) {
      print('error while getting data is $e');
    } finally {
      isLoggingIn(false);
    }
  }
}
