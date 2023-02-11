import 'package:api_userlist/anil/state_management.dart/login_provider.dart';
import 'package:api_userlist/anil/ui/login.dart';
import 'package:api_userlist/anil/ui/signup.dart';
import 'package:api_userlist/screens/get_api.dart';
import 'package:api_userlist/screens/post_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        '/SignUpScreen' :(context) => const SignUpScreen(),
      }
    );
  }
}

