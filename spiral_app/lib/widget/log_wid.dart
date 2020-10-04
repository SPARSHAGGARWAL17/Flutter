import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class TextWidget extends StatelessWidget {
  final String labelText;
  TextWidget(this.labelText);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        showCursor: true,
        decoration: InputDecoration(
          hintText: labelText,
          filled: true,
          fillColor: secondContainer,
          labelStyle: TextStyle(
            color: textColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
        ),
      ),
    );
  }
}

class Texts extends StatelessWidget {
  final String text;
  Texts(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.headline3.copyWith(color: Colors.white),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  Buttons(this.text);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: StadiumBorder(),
      color: Color(0xffFfaa00),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(LandingPage.LandingRoute);
      },
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: Container(
        child: Text(text),
      ),
    );
  }
}

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Texts('Join\nUs!'),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: kPrimaryColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200, width: 250, child: Image.asset(signUpImage)),
                SizedBox(
                  height: 50,
                ),
                TextWidget('Name'),
                TextWidget('Username'),
                TextWidget('Password'),
                SizedBox(height: 20),
                Buttons('Sign Up'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
