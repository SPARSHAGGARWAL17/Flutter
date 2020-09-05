import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.exit_to_app,
              color: Colors.lightGreen[800],
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Journal",
          style: TextStyle(
            color: Colors.lightGreen[800],
          ),
        ),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightGreen, Colors.lightGreen[50]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightGreen[50], Colors.lightGreen],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating pressed.');
        },
        backgroundColor: Colors.lightGreen[300],
        child: Icon(Icons.add),
      ),
    );
  }
}
