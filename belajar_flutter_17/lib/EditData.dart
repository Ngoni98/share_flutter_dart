import 'package:belajar_flutter_17/api/link.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController cCode;
  TextEditingController cName;
  TextEditingController cPrice;
  TextEditingController cStock;
  
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cCode = TextEditingController(text: widget.list[widget.index]['item_code']);
    cName = TextEditingController(text: widget.list[widget.index]['item_name']);
    cPrice = TextEditingController(text: widget.list[widget.index]['price']);
    cStock = TextEditingController(text: widget.list[widget.index]['stock']);
  }


  void mengubahDataNya(BuildContext context) async {
    var mantap = {
      "item_code": cCode.text,
      "item_name": cName.text,
      "price": cPrice.text,
      "stock": cStock.text
    };

    var id = widget.list[widget.index]['id'];

    final response = await mengubahData(id, mantap);
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
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Edit Data"),
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
                    mengubahDataNya(context);
                  },
                  child: Text('EDIT DATA'),
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