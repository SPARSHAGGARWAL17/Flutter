import 'package:flutter/material.dart';

List<String> time = new List.filled(6, '0', growable: true);
const Color kBackground = Color(0xFF09070B);
const Color kActive = Color(0xFFFF0077);
TextStyle numtext() {
  return TextStyle(
    fontSize: 35,
    color: Colors.white,
  );
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String hours;
  String min;
  String sec;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 135,
          backgroundColor: Color(0xFFEF8CFF),
        ),
        CircleAvatar(
          radius: 130,
          backgroundColor: kBackground,
          foregroundColor: Colors.white,
          child: Text(
            time[0] +
                time[1] +
                ':' +
                time[2] +
                time[3] +
                ':' +
                time[4] +
                time[5],
            style: numtext(),
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: kActive,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          'START',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Numpad extends StatefulWidget {
  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumButton(1),
              NumButton(2),
              NumButton(3),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumButton(4),
              NumButton(5),
              NumButton(6),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumButton(7),
              NumButton(8),
              NumButton(9),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumButton(''),
              NumButton(0),
              FlatButton(
                child: Text(
                  '<',
                  style: numtext(),
                ),
                onPressed: () {
                  if (time == null) {
                    print('null');
                  } else {
                    time.removeLast();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class NumButton extends StatefulWidget {
  NumButton(this.number);
  final number;

  @override
  _NumButtonState createState() => _NumButtonState();
}

class _NumButtonState extends State<NumButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          time[4] = '2';
          print(time);
        });
      },
      child: Text(
        widget.number.toString(),
        style: numtext(),
      ),
    );
  }
}
