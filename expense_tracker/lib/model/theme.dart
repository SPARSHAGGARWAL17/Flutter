import 'package:flutter/material.dart';

ThemeData themeLight = ThemeData.light().copyWith(
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.light(primary: Colors.red),
  primaryColor: Colors.red,
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: ThemeData.light().scaffoldBackgroundColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);

ThemeData themeDark = ThemeData.dark().copyWith(
  toggleableActiveColor: Colors.red,
  colorScheme: ColorScheme.dark(
    primary: Colors.red,
  ),
  appBarTheme: AppBarTheme(
    color: ThemeData.dark().scaffoldBackgroundColor,
  ),
  primaryColor: Colors.red,
  cardColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);
