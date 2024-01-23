import 'package:flutter/material.dart';

class Foolish extends StatefulWidget {
  const Foolish({super.key});

  @override
  State<Foolish> createState() => FoolishState();
}

class FoolishState extends State<Foolish> {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.construction, size: 200)),
    );
  }
}
