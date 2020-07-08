import 'package:flutter/material.dart';
import 'package:timer_app/mainpage.dart';
import 'package:timer_app/timerstart.dart';
import 'countdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TimerStart(),
    );
  }
}
