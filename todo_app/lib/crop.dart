import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_image_crop/simple_image_crop.dart';

class SimpleCropRoute extends StatelessWidget {
  final File image;
  final cropKey = GlobalKey<ImgCropState>();
  SimpleCropRoute({@required this.image});
  Widget _cropImage() {
    return ImgCrop.file(
      image,
      key: cropKey,
      chipRadius: 100,
      chipShape: "Circle",
    );
  }

  Widget imageOrText(BuildContext context) {
    if (image != null) {
      return Container(
        child: _cropImage(),
      );
    } else {
      return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Zoom and Crop',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: imageOrText(context),
                ),
              ),
            ),
            FlatButton(
              child: Text('Crop'),
              color: Colors.green,
              padding: EdgeInsets.all(20),
              onPressed: () async {
                final crop = cropKey.currentState;
                File croppedFile =
                    await crop.cropCompleted(image, pictureQuality: 600);
                Navigator.pop(context, croppedFile);
              },
            )
          ],
        ),
      ),
    );
  }
}
