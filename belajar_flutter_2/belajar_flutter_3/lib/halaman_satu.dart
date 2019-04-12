import 'package:flutter/material.dart';

class Halsatu extends StatelessWidget {
  @override
  Widget build(BuildContext context ) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Musik'),
        backgroundColor: Colors.teal,
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(
            Icons.headset,
            size: 50.0,
            color: Colors.teal,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/Haldua');
          },
        ),
      ),
    );
  }
}
