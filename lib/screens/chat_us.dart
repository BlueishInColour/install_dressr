import 'package:flutter/material.dart';

class ChatUs extends StatefulWidget {
  const ChatUs({super.key});

  @override
  State<ChatUs> createState() => ChatUsState();
}

class ChatUsState extends State<ChatUs> {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.construction, size: 200)),
    );
  }
}
