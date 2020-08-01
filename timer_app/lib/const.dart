import 'dart:async';

import 'package:flutter/material.dart';

int _start = 10;

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final bool active;
  Function onChanged;
  Button({this.active, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onChanged,
      fillColor: Color(0xffFF0077),
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
      shape: StadiumBorder(),
      child: Text(
        'START',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  void start() {
    Duration time = Duration(seconds: 1);
    Timer.periodic(time, (Timer time) {
      handle(time, _start);
    });
  }

  void handle(Timer timer, int start) {
    if (start < 1) {
      timer.cancel();
    } else {
      start = start - 1;
      print('Inside $start');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      _start.toString(),
      style: TextStyle(fontSize: 30),
    ));
  }
}
