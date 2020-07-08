import 'package:flutter/material.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/timerstart.dart';
import 'stopwatch.dart';

class TimerStart extends StatefulWidget {
  @override
  _TimerStartState createState() => _TimerStartState();
}

class _TimerStartState extends State<TimerStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Container(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TimerPage(),
                    StopWatch(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: kBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        TimerStart();
                      },
                      child: Icon(
                        Icons.timer,
                        color: Color(0xFF707070),
                        size: 40,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        StopWatch();
                      },
                      child: Icon(
                        Icons.watch_later,
                        color: Color(0xFFFF0077),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
