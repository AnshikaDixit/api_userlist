import 'package:api_userlist/anil/state_management.dart/signup_getx.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signinKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _nameController;
  late TextEditingController _phoneNoController;
  late SignInController controller;

  @override
  void initState() {
    controller = SignInController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _nameController = TextEditingController();
    _phoneNoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Getx'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
                  key: _signinKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            label: Text('Name'),
                            hintText: 'Please enter your name here...',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black87,
                            )),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'Please enter your name here...',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black87,
                            )),
                      ),
                      TextFormField(
                        controller: _phoneNoController,
                        decoration: const InputDecoration(
                            label: Text('Phone Number'),
                            hintText: 'Please enter your name here...',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.black87,
                            )),
                      ),
                      TextFormField(
                        controller: _passController,
                        decoration: const InputDecoration(
                            label: Text('Password'),
                            hintText: 'Please enter your name here...',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black87,
                            )),
                      ),
                      
                         FloatingActionButton(
                            onPressed: () {
                              if (_signinKey.currentState!.validate()) {
                                controller.signin();
                              }
                            },
                            child: const Text('SignUp')),
                      
                    ],
                  ))),
        ));
  }
}
