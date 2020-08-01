import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Countdown(
          seconds: 3,
          onFinished: () {
            print('Timer is Done.');
          },
          build: (BuildContext context, double val) {
            return Text(val.toString());
          }),
    );
  }
}
