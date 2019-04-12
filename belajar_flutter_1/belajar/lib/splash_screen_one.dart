import 'package:flutter/material.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepPurple],
                begin: Alignment.centerRight,
                end:Alignment.centerLeft
              )
            ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75.0,
                  child: Icon(
                    Icons.beach_access,
                    color: Colors.deepOrange,
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'Ini Contoh Splash Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                )
              ],
            ) 
        ],
      ),
    );
  }
  
}