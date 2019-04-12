import 'package:flutter/material.dart';
import 'package:belajar/splash_screen_one.dart';
void main() => runApp(MaterialApp(
  title: 'Belajar Flutter',
  theme: ThemeData(
    primaryColor: new Color(0xff622F74),
    accentColor: Colors.orange
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreenOne(), 
));
