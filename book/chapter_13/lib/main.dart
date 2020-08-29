import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<DateTime> dateList = [
    DateTime(2019, 12, 1),
    DateTime(2009, 1, 13),
    DateTime(2019, 2, 16),
    DateTime(2010, 8, 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: dateList.map((e) {
            // dateList.sort();
            return Text('${e.toString()}');
          }).toList(),
        ),
      ),
    );
  }
}
