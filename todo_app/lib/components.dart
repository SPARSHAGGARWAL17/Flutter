import 'package:flutter/material.dart';

import 'const.dart';

List<String> tasks = [
  'Hello',
];
// ignore: must_be_immutable
List<int> click = [1, 0, 0, 0];

class TextTop extends StatelessWidget {
  const TextTop(
      {this.size,
      @required this.text,
      @required this.color,
      @required this.val});
  final String text;
  final Color color;
  final double val;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.aspectRatio * val,
      ),
    );
  }
}

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  switcher(int b) {
    switch (b) {
      case 1:
        click = [1, 0, 0, 0];
        break;
      case 2:
        click = [0, 1, 0, 0];
        break;
      case 3:
        click = [0, 0, 1, 0];
        break;
      case 4:
        click = [0, 0, 0, 1];
        break;

      default:
    }
  }

  Widget buildBottomBar(
      BuildContext context, IconData icon, String text, int a, int b) {
    Color colors = a == 1 ? kActiveColor : kInactiveColor;
    return FlatButton(
      onPressed: () {
        setState(() {
          switcher(b);
        });
      },
      child: Column(
        children: <Widget>[
          Icon(icon, color: colors),
          Text(
            text,
            style: TextStyle(color: colors),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottom = [
      buildBottomBar(context, Icons.assignment, 'Today', click[0], 1),
      buildBottomBar(
          context, Icons.assignment_turned_in, 'Completed', click[1], 2),
      buildBottomBar(
          context, Icons.assignment_return, 'All Tasks', click[2], 3),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: bottom,
    );
  }
}
