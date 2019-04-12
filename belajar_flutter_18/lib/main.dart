import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

import 'dart:math' as Math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Upload MySQL',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  TextEditingController cTitle = TextEditingController();

  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
  
    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);

    var compressImg = File("$path/image_$rand.jpg")
    ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);

    var compressImg = File("$path/image_$rand.jpg")
    ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future upload(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://10.0.2.2:8080/awal/upload");

    var rq = new http.MultipartRequest("POST", uri);
    var mf = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    rq.fields['title'] = cTitle.text;
    rq.files.add(mf);

    var rs = await rq.send();
    if (rs.statusCode == 200) {
      print('Gambar di upload');
    } else {
      print('Upload Gagal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: _image == null
                  ? Text('Gambar belum dipilih')
                  : Image.file(_image),
            ),
            TextField(
              controller: cTitle,
              decoration: InputDecoration(hintText: "Title"),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.image),
                  onPressed: getImageGallery,
                ),
                RaisedButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: getImageCamera,
                ),
                Expanded(
                  child: Container(),
                ),
                RaisedButton(
                  child: Text('UPLOAD'),
                  onPressed: () {
                    upload(_image);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
