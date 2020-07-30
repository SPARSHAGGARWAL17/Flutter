import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void adds(List a, int b) {
    if (a[1] == 0) {
      a[0] = a[1];
      a[1] = b;
    } else if (a[0] == 0) {
      a[0] = b;
    }
  }

  void del(List a) {
    if (a[1] != 0) {
      a[1] = a[0];
      a[0] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer App'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          switcher(3);
                        });
                      },
                      child: Time(
                        a: hrs,
                        pos: 3,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          switcher(2);
                        });
                      },
                      child: Time(
                        a: min,
                        pos: 2,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          switcher(1);
                        });
                      },
                      child: Time(
                        a: sec,
                        pos: 1,
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("save"),
                  onPressed: () {
                    setState(() {
                      adds(sec, 5);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Delete"),
                  onPressed: () {
                    setState(() {
                      del(sec);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  Time({
    @required this.a,
    @required this.pos,
  });
  final List a;
  final int pos;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${a[0]}${a[1]} : ',
      style: TextStyle(
        fontSize: 40,
        color: press[pos - 1] == 1 ? Colors.grey : Colors.black,
      ),
    );
  }
}
