import 'package:flutter/material.dart';
import 'package:timer_app/constants.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'STOPWATCH',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 41,
            ),
          ),
          Clock(),
          Button(),
        ],
      ),
    );
  }
}
