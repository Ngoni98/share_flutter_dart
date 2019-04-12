import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> data;
  Home({this.data});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('List View'),),

      body: new Container(
        child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return new ListTile(
              leading: new Icon(Icons.widgets),
              title: new Text("${data[index]}"),
            );
          },
        ),
      ),
    );
  }
}