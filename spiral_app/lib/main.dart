import 'package:flutter/material.dart';

import 'export.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Mobile())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LandingPage.LandingRoute: (context) => LandingPage(),
        SearchPage.Route: (context) => SearchPage(),
        LoginPage.Route: (context) => LoginPage(),
        FilterPage.Route: (context) => FilterPage(),
        CompareScreen.Route: (context) => CompareScreen(),
      },
      initialRoute: LoginPage.Route,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        appBarTheme: const AppBarTheme(color: Colors.black),
        buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          buttonColor: kPrimaryColor,
        ),
      ),
    );
  }
}
