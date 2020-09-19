import 'package:flutter/material.dart';
import 'export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = false;
  void change(bool value) {
    setState(() {
      theme = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme ? themeLight : themeDark,
      home: LandingPage(
        change: change,
        theme: theme,
      ),
    );
  }
}
