import 'package:belajar_flutter_17/api/link.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController cCode = TextEditingController();
  TextEditingController cName = TextEditingController();
  TextEditingController cPrice = TextEditingController();
  TextEditingController cStock = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  void tambahData(BuildContext context) async {
    var mantap = {
      "item_code": cCode.text,
      "item_name": cName.text,
      "price": cPrice.text,
      "stock": cStock.text
    };

    final response = await menambahData(mantap);
    if(response['status'] == "gagal") {
      final snackBar = SnackBar(
        content: Text(response['pesan']),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: (){
          },
        ),
        duration: Duration(seconds: 2),
      );
      _scaffoldState.currentState.showSnackBar(snackBar);
    }else{
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                buildTextField('Item Code', cCode),
                buildTextField('Item Name', cName),
                buildTextField('Price', cPrice),
                buildTextField('Stock', cStock),
                Padding(padding: EdgeInsets.only(top: 30.0),),
                RaisedButton(
                  onPressed: (){
                    tambahData(context);
                  },
                  child: Text('ADD DATA'),
                  color: Colors.blueAccent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField buildTextField(String text, aksi) {
    return TextField(
      controller: aksi,
      decoration:
          InputDecoration(
            hintText: text, 
            labelText: text),
    );
  }
}
