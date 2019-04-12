import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = "http://10.0.2.2:8080/api/";

mengambilData() async {
  final rs = await http.get(url + 'items/');
  return json.decode(rs.body);
}

menambahData(dataNya) async {
  final rs = await http.post(url + 'items', body: dataNya);
  return json.decode(rs.body);
}

mengubahData(id, dataNya) async {
  final rs = await http.post(url + 'items/' + id, body: dataNya);
  return json.decode(rs.body);
}

menghapusData(id) async {
  final rs = await http.delete(url + 'items/' + id);
  return json.decode(rs.body);
}
