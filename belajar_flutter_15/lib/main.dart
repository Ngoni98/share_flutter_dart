import 'dart:convert';
import 'dart:async';
import 'package:belajar_flutter_15/AdminPage.dart';
import 'package:belajar_flutter_15/session/login_session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());

String namauser = '';
String myName = '';
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum LoginStatus{
  belumLogin,
  login
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login PHP Mysql",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(namauser:namauser),
        // '/UserPage': (BuildContext context) => new UserPage(),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  setLocal(String nama) async{
    setState(() {
      var prefs = new logses();
      prefs.setNama(nama);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }


  _loadData() async {
    SharedPreferences apaWe = await SharedPreferences.getInstance();
    setState(() {
      String kepoNya = apaWe.getString('nama');
      myName = kepoNya;
    });
  }

  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  
  String msg = "";

  Future<List> _login() async {
    final response  = await http.post('http://10.0.2.2:8080/api/login/user', body: {
      'email': email.text,
      'password': pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Gagal Login";  
      });

    }else{
      if (datauser[0]['type_id'] == "1") {
        Navigator.pushReplacementNamed(context, '/AdminPage');
        setLocal(datauser[0]['nama']);
      }
      // else if(datauser[0]['type_id'] == "2"){
      //   print("Selamat datang user");
      // }

      setState(() {
          namauser = datauser[0]['nama'];
      });
    }

    return datauser;
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    if(myName != '' && myName != null) {
      return AdminPage(namauser: myName);
    }else{
      return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Email", style: TextStyle(fontSize: 18.0)),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email'
                )
              ),
              Text("Password", style: TextStyle(fontSize: 18.0)),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password'
                )
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  _login();
                },
              ),

              Text(msg, style: TextStyle(fontSize: 20.0, color: Colors.red))
            ],
          ),
        ),
      ),
    );
    }
  }
}
