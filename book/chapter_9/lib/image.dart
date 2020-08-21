import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: ImageScaling(),
    );
  }
}

class ImageScaling extends StatefulWidget {
  @override
  _ImageScalingState createState() => _ImageScalingState();
}

class _ImageScalingState extends State<ImageScaling> {
  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image(
          image: AssetImage('assets/image.jpg'),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // _transformScaleAndTranslate(),
          _positionedStatusBar(context),
          _transformMatrix4(),
        ],
      ),
    );
  }

  Transform _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image(
        image: AssetImage('assets/image.jpg'),
      ),
    );
  }

  Positioned _positionedStatusBar(BuildContext context) {
    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.purple[100],
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Scale : ${_currentScale.toStringAsFixed(4)}'),
            Text('Current : $_currentOffset'),
          ],
        ),
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    print('================================Details :$details');
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    var currentScale;
    print('ScaleDetails : $details - Scale : ${details.scale}');
    if (details.scale != 1.0) {
      currentScale = _lastScale * details.scale;
      if (currentScale <= 0.5) {
        setState(() {
          currentScale = 0.5;
        });
      }
      setState(() {
        _currentScale = currentScale;
      });
      print('Scale : $_currentScale - lastScale : $_lastScale');
    } else if (details.scale == 1.0) {
      Offset offsetAdjustedForScale =
          (_startLastOffset - _lastOffset) / _lastScale;
      Offset currentOffset =
          details.focalPoint - (offsetAdjustedForScale * _currentScale);
      setState(() {
        _currentOffset = currentOffset;
      });
      print(
          'OffsetAdjusted : $offsetAdjustedForScale - currentOffset : $currentOffset');
    }
  }

  void _onDoubleTap() {
    print('doubleTap');
    double currentScale = _lastScale * 2.0;
    if (currentScale > 16.0) {
      print('yes');
      setState(() {
        currentScale = 1.0;
        _resetDefaultValues();
      });
    }
    _lastScale = currentScale;
    setState(() {
      _currentScale = currentScale;
    });
  }

  void _resetDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _currentScale = 1.0;
    _lastScale = 1.0;
  }

  void _onLongPress() {
    print('LongPress');
    setState(() {
      _resetDefaultValues();
    });
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
