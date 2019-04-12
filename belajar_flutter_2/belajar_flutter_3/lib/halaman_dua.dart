import 'package:flutter/material.dart';

class Haldua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Speaker'),
        backgroundColor: Colors.teal,
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.speaker, size: 50.0, color: Colors.teal),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
