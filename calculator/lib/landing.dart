import 'package:flutter/material.dart';
import 'func.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool sign = false;
  bool displayText = true;
  bool displayResult = false;
  bool firstNumber = true;
  checkOperator(String op) {
    if (op == "+" || op == '-' || op == '/' || op == '*') {
      setState(() {
        sign = true;
        displayText = false;
        firstNumber = false;
        operate = op;
      });
    } else if (op == '=') {
      setState(() {
        if (operate == '+') {
          result = firstNum + lastNum;
        } else if (operate == '-') {
          result = firstNum - lastNum;
        } else if (operate == '*') {
          result = firstNum * lastNum;
        } else if (operate == '/') {
          result = firstNum / lastNum;
        }
      });
      displayResult = true;
      print(result);
      firstNum = 0;
      lastNum = 0;
      display = '';
      operate = ' ';
      sign = false;
    } else if (op == 'AC') {
      setState(() {
        result = null;
        firstNum = 0;
        lastNum = 0;
        display = '';
        operate = ' ';
        sign = false;
      });
    }
  }

  Expanded buildNumber(Size size, String number, bool color) {
    return Expanded(
      child: Container(
        height: size.height * 0.115,
        color: color ? Color(0xff474747) : Color(0xffffa200),
        child: FlatButton(
            onPressed: () {
              setState(() {
                checkOperator(number);
                if (!sign &&
                    number != '*' &&
                    number != '+' &&
                    number != '-' &&
                    number != '/' &&
                    number != '=' &&
                    number != 'AC') {
                  display += number;
                  result = null;
                  firstNum = int.parse(display);
                  print(firstNum);
                } else if (!firstNumber &&
                    number != '*' &&
                    number != '+' &&
                    number != '-' &&
                    number != '/' &&
                    number != '=' &&
                    number != 'AC') {
                  displayText = true;
                  display += number;
                  lastNum = int.parse(display);
                  print('last = $lastNum');
                } else {
                  display = '';
                  // print(result);

                  print('op = $operate');
                }
              });
            },
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff242424),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
              child: Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[600],
              thickness: 1.5,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(
                        'Output',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 5,
                      child: Text(
                        result == null ? display : result.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ],
                ),
                // color: Colors.white,
              ),
            ),
            Divider(
              color: Colors.grey[600],
              thickness: 1.5,
            ),
            Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff474747),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.039,
                      ),
                      Row(
                        children: <Widget>[
                          buildNumber(size, "7", true),
                          buildNumber(size, "8", true),
                          buildNumber(size, "9", true),
                          buildNumber(size, "+", true),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumber(size, "4", true),
                          buildNumber(size, "5", true),
                          buildNumber(size, "6", true),
                          buildNumber(size, "-", true),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumber(
                            size,
                            "1",
                            true,
                          ),
                          buildNumber(size, "2", true),
                          buildNumber(size, "3", true),
                          buildNumber(size, "*", true),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildNumber(size, "AC", true),
                          buildNumber(size, "0", true),
                          buildNumber(size, "/", true),
                          buildNumber(
                            size,
                            "=",
                            false,
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
