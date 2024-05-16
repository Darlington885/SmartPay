

import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage{

  SharedPreferences sharedPreferences;

  saveStringData(String key, String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);

  }

  saveBoolData(String key, bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);

  }

  getStringData(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);

  }

  getBoolData(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }
}