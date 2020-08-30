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
        primarySwatch: Colors.grey,
        canvasColor: Colors.grey[200],
      ),
      theme: ThemeData.dark(),
      home: EntryPage(),
    );
  }
}
