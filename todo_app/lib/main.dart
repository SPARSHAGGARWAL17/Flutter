import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [0, 1, 2];
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.green,
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.blue,
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.red,
              )
            ],
            physics: ScrollPhysics(),
          ),
          Positioned(
            height: 200,
            child: Row(
              children: pages.map((e) {
                return Container(
                  height: 20,
                  width: 20,
                  color: currentPage == e ? Colors.black : Colors.grey,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
