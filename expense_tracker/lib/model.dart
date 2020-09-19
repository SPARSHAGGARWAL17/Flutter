import 'package:flutter/material.dart';
import 'export.dart';

class Transaction {
  String title;
  String id;
  String date;
  double amount;
  Transaction({this.amount, this.date, this.id, this.title});
}

ThemeData themeLight = ThemeData.light().copyWith(
  primaryColor: Colors.red,
  colorScheme: ColorScheme(
    primary: Colors.red,
    primaryVariant: Colors.black,
    secondary: Colors.grey,
    secondaryVariant: Colors.blueGrey,
    background: Colors.white,
    onBackground: Colors.white,
    onError: Colors.yellow,
    brightness: Brightness.light,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.red,
    onPrimary: Colors.white,
    error: Colors.yellow,
  ),
  cardColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);

ThemeData themeDark = ThemeData.dark().copyWith(
  primaryColor: Colors.red,
  colorScheme: ColorScheme(
    primary: Colors.red,
    primaryVariant: Colors.white,
    secondary: Colors.grey,
    secondaryVariant: Colors.blueGrey,
    background: Colors.white,
    onBackground: Colors.white,
    onError: Colors.yellow,
    brightness: Brightness.light,
    onSecondary: Colors.black,
    surface: Colors.black,
    onSurface: Colors.red,
    onPrimary: Colors.white,
    error: Colors.yellow,
  ),
  cardColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);
