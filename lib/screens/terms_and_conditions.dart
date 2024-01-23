import 'package:flutter/material.dart';
import 'package:install_dressup/screens/fake_data.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({super.key, required this.termsAndCondition});
  String termsAndCondition = ' ';
  @override
  State<TermsAndConditions> createState() => TermsAndConditionsState();
}

class TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [Text(widget.termsAndCondition)],
      ),
    ));
  }
}
