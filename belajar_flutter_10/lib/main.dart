import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama = ["Islam", "Kristen", "Hindu", "Budha", "Kepo"];
  String _agama = "Islam";

  String _jk = "";

  TextEditingController cNama = new TextEditingController();
  TextEditingController cPass = new TextEditingController();
  TextEditingController cMoto = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimData() {
    AlertDialog ad = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${cNama.text}"),
            new Text("Password : ${cPass.text}"),
            new Text("Moto Hidup : ${cPass.text}"),
            new Text("Jenis Kelamin : $_jk"),
            new Text("Agama : $_agama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        )
      ),
    );

    showDialog(context: context, child: ad);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Formulir"),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: cNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: cPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: cMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                      hintText: "Moto Hidup",
                      labelText: "Moto Hidup",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      )),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                    value: "Laki-laki",
                    title: new Text("Laki-laki"),
                    groupValue: _jk,
                    onChanged: (String value) {
                      _pilihJk(value);
                    },
                    activeColor: Colors.red,
                    subtitle: new Text("Pilih ini jika anda Laki-laki")),
                new RadioListTile(
                    value: "Perempuan",
                    title: new Text("Perempuan"),
                    groupValue: _jk,
                    onChanged: (String value) {
                      _pilihJk(value);
                    },
                    activeColor: Colors.red,
                    subtitle: new Text("Pilih ini jika anda Perempuan")),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text("Agama    ",
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.blue)),
                    new DropdownButton(
                      value: _agama,
                      items: agama.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        _pilihAgama(value);
                      },
                    )
                  ],
                ),

                new RaisedButton(
                  child: new Text("Ok"),
                  color: Colors.red,
                  onPressed: () {
                    kirimData();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
