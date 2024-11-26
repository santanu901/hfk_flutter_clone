import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static SharedPrefsService? _instance;
  static late SharedPreferences _preferences;

  //Using a Singleton Pattern
  static Future<SharedPrefsService> getInstance() async {
    _instance ??= SharedPrefsService._();
    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  ///Persist & Retrieve isUserLoggedIn
  bool get isUserLoggedIn => _getPrefsData(AppConstants.prefsKeyIsUserLoggedIn) ?? false;
  set isUserLoggedIn(bool value) => _savePrefsData(AppConstants.prefsKeyIsUserLoggedIn, value);

  ///Generic Method To Get Prefs Data
  dynamic _getPrefsData(String key) {
    var data = _preferences.get(key);
    print("Prefs $key:$data");
    return data;
  }

  ///Generic Method To Set Prefs Data
  void _savePrefsData(String key, dynamic value) {
    if (value is String) {
      _preferences.setString(key, value);
    } else if(value is int) {
      _preferences.setInt(key, value);
    } else if(value is double) {
      _preferences.setDouble(key, value);
    } else if(value is bool) {
      _preferences.setBool(key, value);
    } else if(value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  void _clearPrefsData() {
    _preferences.clear();
  }
}
