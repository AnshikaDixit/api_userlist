import 'package:api_userlist/models/contactmodel.dart';
import 'package:api_userlist/fetchapis/fetch_contact.dart';
import 'package:api_userlist/utils/listtile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactModel? contactModel;
  getData() async {
    contactModel = await FetchContacts.fetchContacts();
    setState(() {});
  }

  @override 
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      contactModel != null ?
      SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: contactModel!.data!.length,
            itemBuilder: (context, index) {
                return MyListTile(
                contactDetails: contactModel!.data![index].email!,
                name: contactModel!.data![index].firstName!, 
              );
            },
          )) : const Text('error'));
    
  }
  
 
}
