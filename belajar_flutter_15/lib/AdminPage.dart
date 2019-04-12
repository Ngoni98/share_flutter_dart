import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AdminPage extends StatelessWidget {

  final String namauser;
  AdminPage({this.namauser}); 

  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('nama');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Admin'),
      ),
      body: Column(
        children: <Widget>[
          Text('Hai $namauser', style: TextStyle(fontSize:  20.0),),
          

          RaisedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/MyHomePage');
              _logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}