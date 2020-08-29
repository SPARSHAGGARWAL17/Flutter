import 'package:flutter/material.dart';
import 'package:timer_app/stopwatch.dart';
import 'landing.dart';
import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff09070B),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: page ? LandingPage() : StopwatchPage(),
        ),
        Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    page = true;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      size: 40,
                      color: page ? Color(0xffFF0077) : Color(0xffFDA5CE),
                    ),
                    Text('Timer',
                        style: TextStyle(
                            color:
                                page ? Color(0xffFF0077) : Color(0xffFDA5CE))),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    page = false;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.history,
                      color: !page ? Color(0xffFF0077) : Color(0xffFDA5CE),
                      size: 40,
                    ),
                    Text('StopWatch',
                        style: TextStyle(
                            color:
                                !page ? Color(0xffFF0077) : Color(0xffFDA5CE))),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
