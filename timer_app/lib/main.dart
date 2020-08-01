import 'package:flutter/material.dart';
import 'landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff09070B),
      ),
    );
  }
}
