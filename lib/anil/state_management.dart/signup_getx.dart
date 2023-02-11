import 'package:api_userlist/anil/api/api_services.dart';
import 'package:api_userlist/anil/models/signup_model.dart';
import 'package:api_userlist/screens/get_api.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  SignInModel? signInModel;
  bool isLoggingIn = false;
 
  void signin() async {
    isLoggingIn = true;
    signInModel = await ApiServices.signInApi();
    isLoggingIn = false;
    Get.to(() => const Home()); 
  }

  
}
