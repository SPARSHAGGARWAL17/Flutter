import 'package:flutter/material.dart';
import 'export.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _color;
  Animation<double> _icon;
  bool open = false;

  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() {
            setState(() {});
          });
    _icon = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _color = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(CurvedAnimation(
      curve: Curves.easeInOutExpo,
      parent: _controller,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bottomSheet(BuildContext context) async {
      _scaffold.currentState.showBottomSheet<void>((BuildContext context) {
        return Container(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[700],
                    filled: true,
                    helperText: "Note",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[700],
                    filled: true,
                    helperText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
          height: 300,
          width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, spreadRadius: 8, color: Colors.grey[700]),
            ],
            color: Theme.of(context).cardColor,
          ),
        );
      });
    }

    void _animate(context) {
      if (!open) {
        _controller.forward();
        bottomSheet(context);
      } else {
        _controller.reverse();
        Navigator.of(context).pop();
      }
      open = !open;
    }

    return Scaffold(
      key: _scaffold,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color.value,
        onPressed: () {
          _animate(context);
        },
        child: Transform.rotate(
          angle: 0.75 * _icon.value,
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            padding: EdgeInsets.all(10),
            icon: Icon(Icons.add),
            onPressed: () {
              _animate(context);
            },
          )
        ],
      ),
      body: TrackerPage(),
    );
  }
}

// ignore: must_be_immutable
class FAButton extends StatefulWidget {
  bool open;
  FAButton({this.open});
  @override
  _FAButtonState createState() => _FAButtonState();
}

class _FAButtonState extends State<FAButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _color;
  Animation<double> _animationIcon;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _color = ColorTween(end: Colors.red).animate(CurvedAnimation(
      curve: Curves.easeInOutExpo,
      parent: _controller,
    ));
    super.initState();
  }

  animate() {
    if (!widget.open) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    widget.open = !widget.open;
  }

  Widget toggle() {
    return FloatingActionButton(
        onPressed: () {
          animate();
        },
        backgroundColor: _color.value,
        child: Transform.rotate(
          angle: 0.75 * _animationIcon.value,
          child: Icon(
            Icons.add,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return toggle();
  }
}
