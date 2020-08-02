import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String text;
  Function onChanged;
  Button({this.text, this.onChanged});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RaisedButton(
      onPressed: onChanged,
      disabledColor: Color(0xffFDA5CE),
      color: Color(0xffFF0077),
      shape: StadiumBorder(),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.07,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  final String time;
  TimerWidget({this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Text(
          time,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ));
  }
}

// ignore: must_be_immutable
class BuildNumber extends StatelessWidget {
  final String text;
  final int initial;
  Function onChanged;
  BuildNumber({this.text, this.initial, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        NumberPicker.integer(
          initialValue: initial,
          minValue: 0,
          maxValue: 59,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
