import 'package:api_userlist/anil/state_management.dart/signup_getx.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  SignInController controller = Get.put(SignInController());

  @override
  void initState() {
    
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
    bool passToggle = true;

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
                        decoration: InputDecoration(
                            label: const Text('Name'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: 'Please enter your name here...',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black87,
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          } else if (value.length < 2) {
                            return "Enter a valid name";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            label: const Text('Email'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: 'Please enter your email here...',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black87,
                            )),
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                      ),
                      IntlPhoneField(
                        controller: _phoneNoController,
                        initialCountryCode: 'IN',
                        decoration: InputDecoration(
                            label: const Text('Phone Number'),
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: 'Please enter your phone number here...',
                            prefixIcon: const Icon(
                              Icons.call,
                              color: Colors.black87,
                            )),
                      ),
                      TextFormField(
                        obscureText: passToggle,
                        controller: _passController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          hintText: 'Please enter your password here...',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black87,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          var passNonNullValue = value ?? "";
                          if (passNonNullValue.isEmpty) {
                            return ("Password is required");
                          } else if (passNonNullValue.length < 6) {
                            return ("Password Must be more than 5 characters");
                          } else if (!regex.hasMatch(passNonNullValue)) {
                            return ("Password should contain UpperCase Alphabet, LowerCase Alphabet, Digit and Special character");
                          }
                          return null;
                        },
                      ),
                      FloatingActionButton(
                            onPressed: () {
                              if (_signinKey.currentState!.validate()) {
                                controller.fetchData();
                              }
                            },
                            child: Obx(
                              () => controller.isLoggingIn.value
                                  ? const CircularProgressIndicator(color: Colors.white,)
                                  : const Text("SignIn"),
                            )),
                    ],
                  ))),
        ));
  }
}
