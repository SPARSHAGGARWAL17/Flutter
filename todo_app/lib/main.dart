import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'package:todo_app/crop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final imgCrop = GlobalKey<ImgCropState>();
  File image;
  File images;
  var pickedImage;
  final picker = ImagePicker();
  Future getImage(BuildContext context) async {
    // ignore: deprecated_member_use
    pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage.path);
    });
    Navigator.of(context).pop();
    images = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SimpleCropRoute(
          image: image,
        ),
      ),
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: File(images)));
  }

  Future getCameraImage(BuildContext context) async {
    // ignore: deprecated_member_use
    pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage.path);
      print(image.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Option'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () async {
                    getImage(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () async {
                    getCameraImage(context);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget imageOrText(BuildContext context) {
    if (image != null) {
      return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(image),
          ),
        ),
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Text('hello'),
              imageOrText(context),
              RaisedButton(
                onPressed: () {
                  _showMyDialog(context);
                },
                child: Text('Click Here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
