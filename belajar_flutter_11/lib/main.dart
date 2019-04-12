import 'package:flutter/material.dart';
import 'package:belajar_flutter_11/Pages/SignUp.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo We',
      theme: new ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFFE8716D),
        primaryColor: Color(0xFF2E3E52),
        buttonColor: Color(0xFF6ADCC8),
        primaryColorDark: Color(0xFF7C8BA6)
      ),
      home: new SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}




