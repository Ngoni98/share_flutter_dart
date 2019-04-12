import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: "Input Text, Alert, & Snackbar",
  home: new Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String teks = "";
  TextEditingController controllerInput = new TextEditingController();
  TextEditingController controllerAlert = new TextEditingController();
  TextEditingController controllerSnackbar = new TextEditingController();
  
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _alertDialog(String str){
    if(str.isEmpty) return;
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(str, style: new TextStyle(fontSize: 20.0),),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.purple,
          child: new Text("OK", style: new TextStyle(color: Colors.white),),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  void _snackbar(String str){
    if (str.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text(str,style: new TextStyle(fontSize: 20.0),),
      duration: new Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('Input Text, Alert, & Snackbar'),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controllerInput,
              decoration: new InputDecoration(
                hintText: 'Tulis disini'
              ),
              onSubmitted: (String str){
                setState(() {
                  teks= str + '\n' + teks;
                  controllerInput.text = "";
                });
              },
            ),
            new Text(teks,style: new  TextStyle(fontSize: 20.0)),
            new TextField(
              controller: controllerAlert,
              decoration: new InputDecoration(
                hintText: 'Tulis disini Alert'
              ),
              onSubmitted: (String str){
                _alertDialog(str);
                controllerAlert.text = "";
              },
            ),
            new TextField(
              controller: controllerSnackbar,
              decoration: new InputDecoration(
                hintText: 'Tulis disini Snackbar'
              ),
              onSubmitted: (String str){
                _snackbar(str);
                controllerSnackbar.text = "";
              },
            )
          ],
        ),
      ),
    );
  }
}
