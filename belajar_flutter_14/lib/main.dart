import 'package:belajar_flutter_14/commons/collapsing_navigation_drawer.dart';
import 'package:belajar_flutter_14/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Sidebar Versi Mantap'),
      ),
      body: Stack(
        children: <Widget>[
          Container(color: selectedColor),
          CollapsingNavigationDrawer()
        ],
      ),
    );
  }
}