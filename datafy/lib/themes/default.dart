import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primaryColor = Colors.green;

  /// Light theme colors
  static const Color primaryLight = Color(0xFF184782);
  static const Color primaryVariantLight = Color(0xFF0E2B4E);
  static const Color secondaryLight = Color(0xFFE59A18);
  static const Color secondaryVariantLight = Color(0xFFF0B03F);
  static const Color backgroundLight = Color(0xFFF9F9F9);
  static const Color surfaceLight = Color(0xFFFBFBFB);
  static const Color scaffoldBackgroundLight = Color(0xFFFDFDFD);

  // Dark theme colors
  static const Color primaryDark = Color(0xFF6098D3);
  static const Color primaryVariantDark = Color(0xFF5F87B2);
  static const Color secondaryDark = Color(0xFFEDBA62);
  static const Color secondaryVariantDark = Color(0xFFEAB04D);
  static const Color backgroundDark = Color(0xFF121517);
  static const Color surfaceDark = Color(0xFF131517);

  static final ThemeData defaultTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: surfaceDark,
    primaryColor: primaryLight,
    appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark, foregroundColor: primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: secondaryVariantDark, foregroundColor: Colors.white)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: surfaceDark, foregroundColor: surfaceDark),
    listTileTheme: const ListTileThemeData(iconColor: primaryColor),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: secondaryVariantLight,
      scaffoldBackgroundColor: scaffoldBackgroundLight,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, foregroundColor: secondaryVariantLight),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: secondaryVariantLight, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: secondaryVariantLight)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondaryVariantLight, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: secondaryVariantLight));
}
