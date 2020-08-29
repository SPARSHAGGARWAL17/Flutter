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
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.aspectRatio * 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        tasks.add('Hello 2');
                      });
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (tasks.length != 0) {
                          tasks.removeLast();
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: <Widget>[
                        TaskList(size: size, index: index),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 10, bottom: 10),
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

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
    @required this.size,
    @required this.index,
  }) : super(key: key);
  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: 10, left: 30, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tasks[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: size.aspectRatio * 50,
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
    );
  }
}
