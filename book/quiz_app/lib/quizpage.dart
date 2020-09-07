import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Center(
        child: QuestionAns(),
      ),
    );
  }
}

class QuestionAns extends StatefulWidget {
  @override
  _QuestionAnsState createState() => _QuestionAnsState();
}

class _QuestionAnsState extends State<QuestionAns> {
  List<String> questions = [
    "Are you a human?",
    "Are you a robot?",
    "Do you like ice cream",
  ];
  void changeQues(int no) {}

  List<bool> answer = [true, false, true];
  int questionNo = 0;
  int correct = 0;
  int comp = 0;
  void checkAns(bool val) {
    if (answer[questionNo] == val) {
      correct++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return comp != 3
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child: Text(
                  "${questions[questionNo]}",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Button(
                      text: "True",
                      onPressed: () {
                        setState(() {
                          comp++;
                          checkAns(true);
                          if (questionNo + 1 < 3) questionNo++;
                        });
                      }),
                  Button(
                      text: "False",
                      onPressed: () {
                        setState(() {
                          comp++;
                          checkAns(false);
                          if (questionNo + 1 < 3) questionNo++;
                        });
                      }),
                ],
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Hurray!\n$correct/${answer.length}',
                style: Theme.of(context).textTheme.headline1,
              ),
              RaisedButton(
                shape: StadiumBorder(),
                child: Text(
                  'Restart',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  setState(() {
                    comp = 0;
                    correct = 0;
                    questionNo = 0;
                  });
                },
              ),
            ],
          );
  }
}

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  Button({this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      onPressed: onPressed,
      shape: StadiumBorder(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
