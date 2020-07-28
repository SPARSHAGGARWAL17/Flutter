import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool pressed;
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
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          width: double.infinity,
                          height: size.height * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Task Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.aspectRatio * 60,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Description of the Task Goes here.',
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: size.aspectRatio * 35,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                '9:00 AM',
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: size.aspectRatio * 20,
                                ),
                              )
                            ],
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
                child: Bottom(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
