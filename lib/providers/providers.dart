import 'package:flutter/material.dart';
import 'package:datafy/themes/default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool darkmodeEnabled})
      : currentTheme =
            (darkmodeEnabled) ? DefaultTheme.defaultTheme : ThemeData.light();

  setDark() {
    currentTheme = DefaultTheme.defaultTheme;
    notifyListeners();
  }

  setLight() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }
}

class TokenProvider {
  static String _token = '';

  static late SharedPreferences token;

    static Future<void> init() async{
    token = await SharedPreferences.getInstance();
  }

  static String get email{
    return token.getString('token') ?? _token;
  }

}
