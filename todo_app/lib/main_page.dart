import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff13002b),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Hello!',
                              style: buildTextStyle(size, 'RobotoMono', 0.04),
                            ),
                            Text(
                              'Jack',
                              style: buildTextStyle(size, 'Lobster', 0.06),
                            ),
                          ],
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
                    child:
                        Text('Tasks!', style: buildTextStyle(size, '', 0.055)),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        CardTiles(
                          size: size,
                          text: 'Today',
                          color: [Color(0xffcc00ff), Color(0xffff75e1)],
                        ),
                        SizedBox(
                          width: size.aspectRatio * 30,
                        ),
                        CardTiles(
                          size: size,
                          text: 'Completed',
                          color: [Color(0xffcc00ff), Color(0xffff75e1)],
                        ),
                        SizedBox(
                          width: size.aspectRatio * 30,
                        ),
                        CardTiles(
                          size: size,
                          text: 'Upcoming',
                          color: [Color(0xffff3300), Color(0xffffd000)],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: size.height * 0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffc596ff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130),
                ),
              ),
              child: Text(
                'Today!',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 52,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle buildTextStyle(Size size, String font, num val) {
    return TextStyle(
      color: Colors.white,
      fontSize: size.height * val,
      fontWeight: FontWeight.bold,
      fontFamily: font,
    );
  }
}

class CardTiles extends StatelessWidget {
  const CardTiles({
    Key key,
    @required this.size,
    @required this.text,
    @required this.color,
  });
  final String text;
  final Size size;
  final List<Color> color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.aspectRatio * 240,
      width: size.aspectRatio * 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'RobotoMono',
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(size.aspectRatio * 50)),
    );
  }
}
