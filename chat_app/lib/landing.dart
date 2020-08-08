import 'package:flutter/material.dart';
import 'chat.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Container(
        child: Column(
          children: [
            ChatScreen(),
          ],
        ),
      ),
    );
  }
}
