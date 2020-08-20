import 'package:flutter/material.dart';

class DragWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture And Drag'),
      ),
      body: GestureWidget(),
    );
  }
}

class GestureWidget extends StatefulWidget {
  @override
  _GestureWidgetState createState() => _GestureWidgetState();
}

class _GestureWidgetState extends State<GestureWidget> {
  var _paintedColor;
  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: [
          Icon(
            Icons.palette,
            color: Colors.deepPurple,
            size: 48,
          ),
          Text('Drag me Below to change color.'),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepPurple,
        size: 48,
      ),
      data: Colors.deepPurple.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'Drag to cee Color change ',
                  style: TextStyle(color: _paintedColor),
                )
              : Text(
                  'painted color : $acceptedData $rejectedData',
                  style: TextStyle(
                      color: Color(acceptedData[0]),
                      fontWeight: FontWeight.bold),
                ),
    );
  }

  String _gestureText = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGestureDetector(),
          Divider(),
          _buildDraggable(),
          Divider(),
          _buildDragTarget(),
          Text('$_gestureText'),
        ],
      ),
    );
  }

  void _gestureDetector(String text) {
    setState(() {
      _gestureText = text;
    });
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _gestureDetector('onTap');
      },
      onLongPress: () {
        print('onLongPress');
        _gestureDetector('onLongTap');
      },
      onDoubleTap: () {
        print('doubleTap');
        _gestureDetector('doubleTap');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate : $details');
        _gestureDetector('onPanUpdate : \n$details');
      },
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.purple[300],
        child: Icon(
          Icons.alarm,
          size: 80,
          color: Colors.black,
        ),
      ),
    );
  }
}
