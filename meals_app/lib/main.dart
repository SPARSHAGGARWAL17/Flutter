import 'package:flutter/material.dart';
import 'export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                color: kTextColor,
                fontSize: 30,
                fontFamily: kTextFamily,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
