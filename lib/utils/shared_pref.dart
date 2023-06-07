import 'package:shared_preferences/shared_preferences.dart';

import 'data_user.dart';

class LoginPref {
  static Future<bool> saveToSharedPref(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("token")) {
      pref.remove("token");
    }
    pref.setString("token", token);

    return true;
  }
  static Future<bool> saveidVehicleSharedPref(int idVehicle) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("id_vehicle")) {
      pref.remove("id_vehicle");
    }
    pref.setInt("id_vehicle", idVehicle);

    return true;
  }

  //cek apakah user memiliki preference sengan key "id_user"
  static Future<bool> checkPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //jika ada maka bernilai true, jika tidak maka bernilai false
    bool status = pref.containsKey("token");

    return status;
  }
  static Future<bool> checkidVehiclePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //jika ada maka bernilai true, jika tidak maka bernilai false
    bool status = pref.containsKey("id_vehicle");

    return status;
  }
  //cara untuk mengambil nilai pref
  static Future <DataUser> getPref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    DataUser dataUser = DataUser();
    dataUser.token = pref.getString("token");
    return dataUser;
  }
  static Future <DataUser> getidVehiclePref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    DataUser dataUser = DataUser();
    dataUser.idVehicle = pref.getInt("id_vehicle");
    return dataUser;
  }
  static Future<bool> removePref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("token");
    return true;
  }
  static Future<bool> removeidVehiclePref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("id_vehicle");
    return true;
  }

}
