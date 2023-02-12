import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaqoob_test_project/Models/login_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken") != null ? true : false;
  }

  static Future<void> setLoginDetails(LoginResponseModel? loginResponse) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", loginResponse!.data!);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken");
  }

  static Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("accessToken");
    await Fluttertoast.showToast(msg: "Logout");
  }
}
