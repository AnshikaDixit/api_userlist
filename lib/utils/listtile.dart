import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  String name;
 
  String contactDetails;
  MyListTile({
    super.key,
   
    required this.contactDetails,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name),
        subtitle: Text(contactDetails),
      );
  }
}
