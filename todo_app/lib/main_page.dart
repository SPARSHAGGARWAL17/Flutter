import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'const.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool pressed;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('User.png'),
                    radius: size.aspectRatio * 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextTop(
                          size: size,
                          text: 'Hello!',
                          color: Colors.white,
                          val: 35),
                      TextTop(
                          size: size,
                          text: 'Jack Brother',
                          color: Colors.grey,
                          val: 35)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.aspectRatio * 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: Text(
                            'Meeting',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    activeOrInactive(true),
                    activeOrInactive(false),
                    activeOrInactive(true),
                    activeOrInactive(false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar(IconData icon, String text, Color colors) {
    return FlatButton(
      onPressed: () {
        print('hello');
      },
      child: Column(
        children: <Widget>[
          Icon(icon, color: colors),
          Text(
            text,
            style: TextStyle(color: colors),
          ),
        ],
      ),
    );
  }

  Widget activeOrInactive(bool val) {
    if (val == true) {
      return buildBottomBar(Icons.assignment, 'Today', kActiveColor);
    } else {
      return buildBottomBar(
          Icons.assignment_turned_in, 'Today', kInactiveColor);
    }
  }
}

class TextTop extends StatelessWidget {
  const TextTop(
      {this.size,
      @required this.text,
      @required this.color,
      @required this.val});
  final String text;
  final Color color;
  final double val;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.aspectRatio * val,
      ),
    );
  }
}
