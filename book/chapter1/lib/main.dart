import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool showFirst = true;
  bool open = false;
  AnimationController _controller;
  double height = 80;
  double width = 100;
  Animation _upHeight;
  _increase() {
    setState(() {
      open = !open;
      height = open ? 300 : 80;
      if (!open) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _upHeight = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
    );
    print(_upHeight.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedContainer(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.grey[800],
                  elevation: 0,
                  disabledColor: Colors.grey[800],
                  onPressed: open
                      ? null
                      : () {
                          setState(() {
                            _increase();

                            print(_upHeight.value);
                          });
                        },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            height: _upHeight.value,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: child,
                          );
                        },
                        child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _increase();
                              });
                            },
                            child: Container()),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: AnimatedDefaultTextStyle(
                          child: Text('Share Files'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height == 80 ? 20 : 30),
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeInOutExpo,
                        ),
                      ),
                    ],
                  ),
                ),
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOutExpo,
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
