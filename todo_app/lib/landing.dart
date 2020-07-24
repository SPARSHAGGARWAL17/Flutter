import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'crop.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final imgCrop = GlobalKey<ImgCropState>();
  File image;
  File croppedImage;
  String name;
  var pickedImage;
  final picker = ImagePicker();
  Future getImage(BuildContext context) async {
    // ignore: deprecated_member_use
    // croppedImage = null;
    try {
      pickedImage = await picker.getImage(source: ImageSource.gallery);
    } catch (Exception) {
      Navigator.of(context).pop();
    }
    setState(() {
      image = File(pickedImage.path);
    });
    Navigator.of(context).pop();
    croppedImage = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SimpleCropRoute(
          image: image,
        ),
      ),
    );
  }

  Future getCameraImage(BuildContext context) async {
    // ignore: deprecated_member_use
    pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage == null) {
      Navigator.of(context).pop();
    }
    croppedImage = null;
    setState(() {
      image = File(pickedImage.path);
      print(image.path);
    });
    Navigator.of(context).pop();
    croppedImage = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SimpleCropRoute(
          image: image,
        ),
      ),
    );
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
                  child: Container(
                    child: Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () async {
                    getImage(context);
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  child: Container(
                    child: Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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
    if (croppedImage != null) {
      return FlatButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: CircleAvatar(
          backgroundImage: FileImage(croppedImage),
          radius: 100,
        ),
      );
    } else {
      return FlatButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 100,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'User Details',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    imageOrText(context),
                    SizedBox(height: 10),
                    Text(
                      'Click here to Add Picture.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  autocorrect: true,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
