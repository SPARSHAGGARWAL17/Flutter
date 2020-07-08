import 'package:flutter/material.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/countdown.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(
              'TIMER',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 61,
              ),
            ),
          ),
          Clock(),
          Numpad(),
          Button(),
          // Count(2),
        ],
      ),
    );
  }
}
