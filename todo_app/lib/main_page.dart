import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff13002b),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hello! Jack',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      child: Image.asset('User.png'),
                      radius: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: size.aspectRatio * 25),
                child: Text(
                  'Tasks!',
                  style: TextStyle(
                    fontSize: size.aspectRatio * 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Lobster',
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    CardTiles(
                      size: size,
                      text: 'Today',
                    ),
                    SizedBox(
                      width: size.aspectRatio * 30,
                    ),
                    CardTiles(
                      size: size,
                      text: 'Completed',
                    ),
                    SizedBox(
                      width: size.aspectRatio * 30,
                    ),
                    CardTiles(
                      size: size,
                      text: 'Upcoming',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTiles extends StatelessWidget {
  const CardTiles({
    Key key,
    @required this.size,
    @required this.text,
  });
  final String text;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.62,
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, top: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(40)),
    );
  }
}
