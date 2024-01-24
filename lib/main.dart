import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:install_dressup/firebase_options.dart';
import 'package:install_dressup/screens/edit_app_details.dart';
import 'package:install_dressup/screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAppCheck.instance.activate(
  // androidProvider: AndroidProvider.playIntegrity,
  // webProvider:
  // ReCaptchaV3Provider('6LfPKFIpAAAAAGPzlYpoSWP6keZI1ikn8aSLXj0H'),
  // );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Index(),
    theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 6),
        ),
      ),
    ),
  ));
}
