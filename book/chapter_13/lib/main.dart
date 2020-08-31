import 'package:flutter/material.dart';

import 'export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: Colors.grey[200],
      ),
      theme: ThemeData.dark(),
      home: LandingPage(),
    );
  }
}
