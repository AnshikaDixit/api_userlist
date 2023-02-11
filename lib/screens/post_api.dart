import 'dart:convert';

import 'package:api_userlist/models/createusermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}



Future<CreateUserModel> createUser(String name, String jobTitle) async {
  Response response =
      await post(Uri.parse("https://reqres.in/api/users"), body: {
    'name': name,
    'job': jobTitle,
  });

  return CreateUserModel.fromJson(jsonDecode(response.body));
}

class _Screen2State extends State<Screen2> {

  CreateUserModel? _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Api'),
      ),
      body: Column(
        children: [
      TextFormField(
        controller: nameController,
      ),
      TextFormField(
        controller: jobController,
      ),
      const SizedBox(
        height: 32,
      ),

      // _user == null ? Container() :
      //       const Text('${_user.data}'),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobTitle = jobController.text;

          _user = await createUser(name, jobTitle);
          setState(() {
          });
          
        },
        child: const Text('add'),
      ),
    );
  }
}
