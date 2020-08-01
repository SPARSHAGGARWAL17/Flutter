import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'const.dart';

bool active = false;

// ignore: must_be_immutable
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _initialSec = 0;

  int _initialMin = 0;

  int _initialHrs = 0;

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
                radius: size.aspectRatio * 310,
                backgroundColor: Color(0xffEF8CFF),
                child: CircleAvatar(
                  backgroundColor: Color(0xff9D08B5),
                  radius: size.aspectRatio * 300,
                  child: active
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BuildNumber(
                              text: 'HH',
                              initial: _initialHrs,
                            ),
                            BuildNumber(
                              text: 'MM',
                              initial: _initialMin,
                            ),
                            BuildNumber(
                              initial: _initialSec,
                              text: 'SS',
                            ),
                          ],
                        )
                      : Text(''),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    active: active,
                  ),
                  Button(
                    active: active,
                    onChanged: () {
                      setState(() {
                        active = !active;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class BuildNumber extends StatefulWidget {
  BuildNumber({
    Key key,
    @required int initial,
    @required this.text,
  })  : _initial = initial,
        super(key: key);
  final String text;
  int _initial;

  @override
  _BuildNumberState createState() => _BuildNumberState();
}

class _BuildNumberState extends State<BuildNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        NumberPicker.integer(
          initialValue: widget._initial,
          minValue: 0,
          maxValue: 59,
          onChanged: (newValue) {
            setState(() {
              widget._initial = newValue;
            });
          },
        ),
      ],
    );
  }
}
