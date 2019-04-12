library logses;
import 'package:shared_preferences/shared_preferences.dart';

class logses {
  
    String myName = '';
    void setNama(String nama) async {
      SharedPreferences apaWe = await SharedPreferences.getInstance();
      apaWe.setString('nama', nama);
      apaWe.commit();
    }
}