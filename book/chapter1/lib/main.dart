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
      height = open ? 400 : 80;
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
    Orientation _orientation = MediaQuery.of(context).orientation;
    List<FoodItem> foodList = [
      FoodItem(quantity: 2, title: 'Banana'),
      FoodItem(quantity: 1, title: 'Grapes'),
      FoodItem(quantity: 3, title: 'Orange'),
      FoodItem(quantity: 4, title: 'Apple'),
    ];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (BuildContext context) {
                  return foodList.map((FoodItem foodItem) {
                    return PopupMenuItem<FoodItem>(
                        child: Row(
                      children: [
                        Text(foodItem.title),
                        SizedBox(width: 20),
                        Text(foodItem.quantity.toString()),
                      ],
                    ));
                  }).toList();
                }),
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
                          });
                        },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            height: _upHeight.value * 3.9,
                            width: _upHeight.value * 15,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  print(_orientation);
                                  _increase();
                                });
                              },
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          height: 10,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: AnimatedDefaultTextStyle(
                          child: Text('Share Files'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: height == 80 ? 20 : 30),
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeInOutExpo,
                        ),
                      ),
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Container(
                              height: _upHeight.value * 29,
                              width: 280,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    buildContainer('Messages', Icons.message,
                                        Colors.green),
                                    SizedBox(height: 15),
                                    buildContainer(
                                        'Mail', Icons.mail, Colors.red),
                                    SizedBox(height: 15),
                                    buildContainer(
                                        'Drive', Icons.cloud, Colors.blue[800]),
                                    SizedBox(height: 15),
                                    buildContainer('Save File',
                                        Icons.insert_drive_file, Colors.grey),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOutExpo,
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildContainer(String text, IconData icon, Color color) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: color),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}

class FoodItem {
  final String title;
  final int quantity;
  FoodItem({this.quantity, this.title});
}
