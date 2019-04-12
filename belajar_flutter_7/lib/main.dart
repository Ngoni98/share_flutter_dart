import 'package:flutter/material.dart';
import 'package:belajar_flutter_7/detail.dart';

void main() => runApp(new MaterialApp(
      title: "Sidebar",
      debugShowCheckedModeBanner: false,
      home: new Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeC64qY5a1dyR9Swr7qgu3kRPLTOIOKFi08lAZbFWOoFw1ySVmWw";
  String gambar2 =
      "http://images6.fanpop.com/image/photos/38600000/Image-nhat4242-38634955-850-850.jpg";
  String backup;

  String nama1 = "Julie Satu";
  String nama2 = "Julie Dua";
  String backupnama;

  void gantiuser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Sidebar (DRAWER)"),
        backgroundColor: Colors.red[700],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(nama1),
              accountEmail: new Text("Khoirul.20998@gmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(nama: nama1,gambar: gambar1,)));
                },
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://cdnb.artstation.com/p/assets/images/images/000/889/699/large/tibor-shoki-toth-julie-sword-2.jpg?1435398998"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => gantiuser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(gambar2),
                  ),
                )
              ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: new Container(),
    );
  }
}
