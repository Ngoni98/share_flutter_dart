import 'package:belajar_flutter_17/EditData.dart';
import 'package:belajar_flutter_17/api/link.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({
    this.list,
    this.index
  });

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void mengHapus() async {
    final response = await menghapusData(widget.list[widget.index]['id']);
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
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);;
    }
  }

  void confirm() {
    AlertDialog ad = AlertDialog(
      content: Text("Apakah anda yakin akan menghapus '${widget.list[widget.index]['item_name']}' ?"),
      actions: <Widget>[
        RaisedButton(
          child: Text("OK DELETE",style: TextStyle(color: Colors.black)),
          color: Colors.red,
          onPressed: () => mengHapus(),
        ),
        RaisedButton(
          child: Text("CANCEL",style: TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: ad);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('${widget.list[widget.index]['item_name']}'),
      ),
      body: Container(
        height: 250.0,
        padding: EdgeInsets.all(20.0),
        child: Card(
          elevation: 4.0,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30.0),),
                Text(widget.list[widget.index]['item_name'], style: TextStyle(fontSize: 20.0)),
                Text("Code: ${widget.list[widget.index]['item_code']}", style: TextStyle(fontSize: 18.0)),
                Text("Price: ${widget.list[widget.index]['price']}", style: TextStyle(fontSize: 18.0)),
                Text("Stock: ${widget.list[widget.index]['stock']}", style: TextStyle(fontSize: 18.0)),
                Padding(padding: EdgeInsets.only(top: 30.0),),


                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Edit'),
                      color: Colors.green,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditData(list: widget.list, index: widget.index)
                        )
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    RaisedButton(
                      child: Text('Delete'),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}