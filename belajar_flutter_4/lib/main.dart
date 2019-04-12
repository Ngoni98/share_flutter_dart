import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'List view',
      home: new Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[900],
        title: new Text('Daftar Tutorial'),
      ),
      body: new ListView(
        children: <Widget>[
          ListTutorial(
            gambar: 'http://idrcorner.com/assets/nn/imgs/html.jpg',
            judul: 'HTML',
          ),
          ListTutorial(
            gambar: 'http://idrcorner.com/assets/nn/imgs/css.jpg',
            judul: 'CSS',
          ),
          ListTutorial(
            gambar: 'http://idrcorner.com/assets/nn/imgs/js.jpg',
            judul: 'JS',
          ),
          ListTutorial(
            gambar: 'http://idrcorner.com/assets/nn/imgs/php.jpg',
            judul: 'PHP',
          )
        ],
      ),
    );
  }
}

class ListTutorial extends StatelessWidget {
  ListTutorial({this.gambar, this.judul});
  final String gambar;
  final String judul;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(
              image: new NetworkImage(gambar),
              width: 80.0,
            ),
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Center(
                child: Column(
                  children: <Widget>[
                    new Text(
                      judul,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Text(
                      "Ini adalah deskripsi tutorial",
                      style: new TextStyle(fontSize: 13.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
