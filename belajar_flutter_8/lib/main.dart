import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "GRID Absolute Duo",
      home: new Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = new List();
  var karakter = [
    {"nama": "Lilith", "gambar": "lilith.jpg"},
    {"nama": "Imari", "gambar": "imari.jpg"},
    {"nama": "Jul Tor", "gambar": "julie_tooru.jpg"},
    {"nama": "Julie", "gambar": "julie.jpg"},
    {"nama": "Miyabi", "gambar": "miyabi.jpg"},
    {"nama": "Rito", "gambar": "rito.jpg"},
    {"nama": "Tachibana", "gambar": "tachibana.jpg"},
    {"nama": "Tooru", "gambar": "tooru.png"},
    {"nama": "Tora", "gambar": "tora.png"},
  ];

  _buatList() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];
      daftarSuperhero.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
            child: new Column(
          children: <Widget>[
            new Hero(
                tag: karakternya["nama"],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                                nama: karakternya["nama"],
                                gambar: gambar,
                              ),
                        )),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Text(karakternya["nama"], style: new TextStyle(fontSize: 20.0))
          ],
        )),
      ));
    }
  }

  @override
  void initState() {
    _buatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Karakter", style: new TextStyle(color: Colors.white)),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "img/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan()
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.star, size: 30.0, color: Colors.red),
              new Text("12", style: new TextStyle(fontSize: 18.0))
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});

  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(icon, size: 50.0, color: Colors.blue),
          new Text(teks, style: TextStyle(fontSize: 18.0, color: Colors.blue))
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
