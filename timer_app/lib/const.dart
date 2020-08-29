import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

bool page = true;

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

// ignore: must_be_immutable
class BuildNumber extends StatelessWidget {
  final String text;
  final int initial;
  Function onChanged;

  BuildNumber({
    this.text,
    this.initial,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        NumberPicker.integer(
          highlightSelectedValue: true,
          listViewWidth: 90,
          infiniteLoop: true,
          initialValue: initial,
          minValue: 0,
          maxValue: 59,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class Time extends StatelessWidget {
  final String hours;
  final String min;
  final String sec;
  Time({this.hours, this.min, this.sec});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Single(
                text: 'HH',
                head: true,
              ),
              Single(
                text: 'MM',
                head: true,
              ),
              Single(
                text: 'SS',
                head: true,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Single(
                text: hours,
                head: false,
              ),
              Text(
                ':',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Single(
                text: min,
                head: false,
              ),
              Text(
                ':',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Single(
                text: sec,
                head: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Single extends StatelessWidget {
  final String text;
  final bool head;
  Single({this.text, this.head});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: head ? 30 : 40,
            fontWeight: head ? FontWeight.normal : FontWeight.bold,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
