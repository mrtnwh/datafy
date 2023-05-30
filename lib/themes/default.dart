import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primaryColor = Colors.green;

  /// Light theme colors
  static const Color primaryLight = Color(0xFF184782);

  // Dark theme colors
  static const Color secondaryVariantDark = Color(0xFFEAB04D);
  static const Color surfaceDark = Color(0xFF131517);

  static final ThemeData defaultTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: surfaceDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceDark,
      foregroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: secondaryVariantDark,
            foregroundColor: Colors.white)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: surfaceDark, foregroundColor: surfaceDark),
    listTileTheme: const ListTileThemeData(iconColor: Colors.green),
  );
}
