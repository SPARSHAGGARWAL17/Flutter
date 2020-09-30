import 'package:flutter/material.dart';
import 'export.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Transaction()),
    ChangeNotifierProvider(create: (_) => ThemeChange()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool theme = Provider.of<ThemeChange>(context).dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: !theme ? themeLight : themeDark,
      home: LandingPage(
        theme: theme,
      ),
    );
  }
}
