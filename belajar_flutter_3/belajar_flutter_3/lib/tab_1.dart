import 'package:flutter/material.dart';

class Tab_satu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text('Tab Pertama', style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage('https://www.confused.com/-/media/confused/other/home-insurance/save-on-insurance-house.png?h=455&w=713&la=en-GB&hash=F2DF88A8C1EE92043BCF9F734A61F279C8934E3D'),width: 200.0,)
          ],
        ),
      ),
    );
  }
}