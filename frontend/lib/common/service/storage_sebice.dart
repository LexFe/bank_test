
import 'package:login/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  late final SharedPreferences _prefs;

  Future<Service> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  //save true or false to storage use in switch
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  //get true or false from storage use in switch
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
  

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  //get user token from storage
  String getUserToken(String key) {
    return _prefs.getString(key) ?? '';
  }
}
