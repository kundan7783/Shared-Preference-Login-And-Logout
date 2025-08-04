import 'package:shared_preferences/shared_preferences.dart';

class SharePre {
  String nameKey = "name";
  String emailKey = "email";
  String passwordKey = "password";
  String phoneKey = "phone";
  String isCheckLogAndOut = "logAndOut";

  Future<void> setData(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(nameKey, name);
    await prefs.setString(emailKey, email);
    await prefs.setString(passwordKey, password);
    await prefs.setString(phoneKey, phone);
    await prefs.setBool(isCheckLogAndOut, true);
  }

  Future<Map<String, dynamic>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      "getName": prefs.getString(nameKey),
      "getEmail": prefs.getString(emailKey),
      "getPassword": prefs.getString(passwordKey),
      "getPhone": prefs.getString(phoneKey),
    };
  }

  Future<void> checkLogAndLogout(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isCheckLogAndOut, status);
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isCheckLogAndOut) ?? false;
  }
}
