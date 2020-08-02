import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'main.dart';

// ignore: must_be_immutable
class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int _initialSec = 0;
  int _initialMin = 0;
  int _initialHrs = 0;
  String hh = '00';
  String mm = '00';
  String ss = '00';
  bool pausedButton = false;
  bool startButton = true;
  bool stopButton = false;
  bool stopPressed = false;
  int timeForTimer = 0;
  int pause = 0;
  String timeToDisplay = '';

  Timer _timer;

  void start(int timeForTimer) {
    timeForTimer = (_initialHrs * 3600 + _initialMin * 60 + _initialSec);
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (stopPressed) {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ),
            );
            timer.cancel();
          });
        } else {
          timeForTimer += 1;
        }
        pause = timeForTimer;

        _initialHrs = timeForTimer ~/ 3600;
        _initialMin = (timeForTimer % 3600) ~/ 60;
        _initialSec = (timeForTimer % 3600) % 60;
        hh = _initialHrs.toString().length == 2
            ? '0$_initialHrs'
            : '0$_initialHrs';
        mm = _initialMin.toString().length == 2
            ? '$_initialMin'
            : '0$_initialMin';
        ss = (_initialSec.toString()).length == 2
            ? '$_initialSec'
            : '0$_initialSec';
        timeToDisplay = '$_initialHrs : $_initialMin : $_initialSec';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'STOPWATCH',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                CircleAvatar(
                  radius: size.width * 0.46,
                  backgroundColor: Color(0xffEF8CFF),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff09070B),
                    radius: size.width * 0.44,
                    child: Time(
                      hours: hh,
                      min: mm,
                      sec: ss,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Button(
                      text: startButton
                          ? 'START'
                          : pausedButton ? 'PAUSE' : 'RESUME',
                      onChanged: startButton
                          ? () {
                              setState(() {
                                startButton = false;
                                pausedButton = true;
                                stopButton = true;
                                start(timeForTimer);
                              });
                            }
                          : pausedButton
                              ? () {
                                  setState(() {
                                    pausedButton = false;
                                    _timer.cancel();
                                  });
                                }
                              : () {
                                  setState(() {
                                    pausedButton = true;
                                    start(pause);
                                  });
                                },
                    ),
                    Button(
                      text: "RESET",
                      onChanged: stopButton
                          ? () {
                              setState(() {
                                stopPressed = true;
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
