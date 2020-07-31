import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(MyApp());
}

class checker {
  checker({this.press, this.clock});
  final List press;
  final Map<int, List> clock;

  void adds(int b) {
    List a = clock[1];
    if (a[1] == 0) {
      a[0] = a[1];
      a[1] = b;
    } else if (a[0] == 0) {
      a[0] = a[1];
      a[1] = b;
    }
  }

  void del(List a) {
    if (a[1] != 0) {
      a[1] = a[0];
      a[0] = 0;
    }
  }

  check(List press, var clock) {
    for (var i = 0; i < 3; i++) {
      if (press[i] == 1) {
        List cur = clock[i + 1];
        print(clock[i + 1]);
        int div = (cur[0] * 10 + cur[1]);
        print(div);
        if (div > 60) {
          adds(div ~/ 60);
          clock[i + 1] = [0, 0];
          print(clock[i + 1]);
        }
      }
    }
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checker(press: press, clock: clock);
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
                      checker.adds(7);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Delete"),
                  onPressed: () {
                    setState(() {
                      for (var i = 0; i < press.length; i++) {
                        if (press[i] == 1) {
                          checker.del(clock[i + 1]);
                        }
                      }
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
      '${a[0]}${a[1]}  ',
      style: TextStyle(
        fontSize: 40,
        color: press[pos - 1] == 1 ? Colors.grey : Colors.black,
      ),
    );
  }
}
