import 'package:api_userlist/anil/state_management.dart/login_provider.dart';
import 'package:api_userlist/anil/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late LoginProvider _loginProvider;

  @override
  void initState() {
    _loginProvider = Provider.of(context, listen: false);
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _emailController.text = "eve.holt@reqres.in";
    _passController.text = "Test123!";
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _passController,
              ),
              Consumer<LoginProvider>(
                builder: (context, loginModel, child) {
                  return TextButton(
                      onPressed: () {
                        if (_loginKey.currentState!.validate()) {
                          _loginProvider.login(
                            context,
                              email: _emailController.text.trim(),
                              password: _passController.text.trim());
                        }
                      },
                      child: loginModel.isLoggingIn ? const CircularProgressIndicator() :  const Text("Login"));
                }
              ),
              GestureDetector(
                child: TextButton(
                  onPressed: () => Get.to(()=> const SignUpScreen()),
                  child: const Text('Dont have an account?')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
