import 'dart:convert';
import 'package:api_userlist/models/contactmodel.dart';
import 'package:api_userlist/models/createusermodel.dart';
import 'package:api_userlist/models/singleusermodel.dart';

import 'package:http/http.dart';

class FetchContacts {
  static Future<ContactModel> fetchContacts() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));

    return ContactModel.fromJson(jsonDecode(response.body));
  }

  static Future<SingleUserModel> fetchsingleuser() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));

    return SingleUserModel.fromJson(jsonDecode(response.body));
  }

 


}
