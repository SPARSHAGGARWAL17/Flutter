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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.timer,
                      size: 40,
                      color: page ? Color(0xffFF0077) : Color(0xffFDA5CE),
                    ),
                    onPressed: () {
                      setState(() {
                        page = true;
                      });
                    },
                  ),
                  Text('Timer',
                      style: TextStyle(
                          color: page ? Color(0xffFF0077) : Color(0xffFDA5CE))),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: !page ? Color(0xffFF0077) : Color(0xffFDA5CE),
                    icon: Icon(
                      Icons.history,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        page = false;
                      });
                    },
                  ),
                  Text('StopWatch',
                      style: TextStyle(
                          color:
                              !page ? Color(0xffFF0077) : Color(0xffFDA5CE))),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
