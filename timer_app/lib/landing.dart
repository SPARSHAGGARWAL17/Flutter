import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'main.dart';

// ignore: must_be_immutable
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _initialSec = 0;
  int _initialMin = 0;
  int _initialHrs = 0;
  String hh = '';
  String mm = '';
  String ss = '';
  bool pausedButton = false;
  bool startButton = true;
  bool stopButton = false;
  bool stopPressed = false;
  int timeForTimer = 0;
  int pause = 0;
  String timeToDisplay = '';

  Timer _timer;

  void start(int timeForTimer) {
    timeForTimer = (_initialHrs * 3600 + _initialMin * 60 + _initialSec) + 1;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (timeForTimer < 1 || stopPressed) {
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
          timeForTimer -= 1;
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
                  'TIMER',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                CircleAvatar(
                  radius: size.width * 0.46,
                  backgroundColor: Color(0xffEF8CFF),
                  child: CircleAvatar(
                      backgroundColor: Color(0xDD09070B),
                      radius: size.width * 0.44,
                      child: startButton
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                BuildNumber(
                                  text: 'HH',
                                  initial: _initialHrs,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _initialHrs = newValue;
                                    });
                                  },
                                ),
                                BuildNumber(
                                  text: 'MM',
                                  initial: _initialMin,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _initialMin = newValue;
                                    });
                                  },
                                ),
                                BuildNumber(
                                  initial: _initialSec,
                                  text: 'SS',
                                  onChanged: (newValue) {
                                    setState(() {
                                      _initialSec = newValue;
                                    });
                                  },
                                ),
                              ],
                            )
                          : Time(
                              hours: hh,
                              min: mm,
                              sec: ss,
                            )),
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
                      text: "STOP",
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
