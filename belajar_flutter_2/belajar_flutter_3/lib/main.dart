import 'package:flutter/material.dart';
import 'package:belajar_flutter_2/halaman_satu.dart';
import 'package:belajar_flutter_2/halaman_dua.dart';

void main() => runApp(MaterialApp(
      title: 'Navigasi',
      debugShowCheckedModeBanner: false,
      home: Halsatu(),
      routes: {
        '/Halsatu': (context) => Halsatu(),
        '/Haldua': (context) => Haldua(),
      },
    ));