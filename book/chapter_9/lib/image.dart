import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageScaling(),
    );
  }
}

class ImageScaling extends StatefulWidget {
  @override
  _ImageScalingState createState() => _ImageScalingState();
}

class _ImageScalingState extends State<ImageScaling> {
  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: [],
      ),
    );
  }

  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
