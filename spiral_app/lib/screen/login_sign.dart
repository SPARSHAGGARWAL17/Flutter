import 'package:flutter/material.dart';
import 'package:spiral_app/const.dart';
import '../widget/log_wid.dart';

class LoginPage extends StatelessWidget {
  static const Route = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts('Welcome\nBack!'),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Image.asset(
                    loginImage,
                    fit: BoxFit.fill,
                  ),
                ),
                TextWidget('Username'),
                TextWidget('Password'),
                SizedBox(
                  height: 20,
                ),
                Center(child: Buttons('Login')),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Sign()),
                      );
                    },
                    child: Text(
                      'New User? Sign Up',
                      style: TextStyle(color: kAccentColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
