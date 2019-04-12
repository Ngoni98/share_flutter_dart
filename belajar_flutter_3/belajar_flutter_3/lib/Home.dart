import 'package:flutter/material.dart';
import 'package:belajar_flutter_3/tab_1.dart' as tab_1;
import 'package:belajar_flutter_3/tab_2.dart' as tab_2;
import 'package:belajar_flutter_3/tab_3.dart' as tab_3;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  
  TabController tol;

  @override
  void initState() {
    tol =  new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    tol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Belajar Tab'),
        backgroundColor: Colors.redAccent[400],
        bottom: new TabBar(
          controller:tol,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home),text: 'Halaman utama',),
            new Tab(icon: new Icon(Icons.headset),text: 'Headset'),
            new Tab(icon: new Icon(Icons.phone_android),text: 'Smart Phone'),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tol,
        children: <Widget>[
          new tab_1.Tab_satu(),
          new tab_2.Tab_dua(),
          new tab_3.Tab_tiga(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.redAccent[400],
        child: new TabBar(
          controller:tol,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.headset)),
            new Tab(icon: new Icon(Icons.phone_android)),
          ],
        ),
      ),
    );
  }
}