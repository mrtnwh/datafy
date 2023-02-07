import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkmode = true;
  static bool _isLogged = false;

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get darkmode {
    return _prefs.getBool('_darkmode') ?? _darkmode;
  }

  static bool get isLogged {
    return _prefs.getBool('_isLogged') ?? _isLogged;
  }

  
  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static set isLogged(bool value) {
    _isLogged = value;
    _prefs.setBool('isLogged', value);
  }
}
