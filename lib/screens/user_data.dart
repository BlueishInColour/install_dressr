import 'package:flutter/material.dart';
import 'package:install_dressup/screens/fake_data.dart';

class UserData extends StatefulWidget {
  UserData({super.key, required this.userData});
  String userData = ' ';

  @override
  State<UserData> createState() => UserDataState();
}

class UserDataState extends State<UserData> {
  @override
  build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [Text(widget.userData)],
      ),
    ));
  }
}
