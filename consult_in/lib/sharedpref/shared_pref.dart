import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setbool(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getbool({required String key}) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> setstring(
      {required String key, required String value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  static String? getstring({required String key}) {
    return sharedPreferences!.getString(key);
  }

  static Future<bool> setint({required String key, required int value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static int? getint({required String key}) {
    return sharedPreferences!.getInt(key);
  }

  static Future<bool> delete(String key) async {
    return await sharedPreferences!.remove(key);
  }
}
