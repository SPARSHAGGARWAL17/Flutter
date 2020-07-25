import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'crop.dart';

const String kDefaultImage = 'User.png';

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
      print("=============================================$pickedImage.info");
      if (pickedImage != null) {
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
        setState(() {
          croppedImage = croppedImage;
        });
      }
    } catch (Exception) {
      Navigator.of(context).pop();
    }
  }

  Future getCameraImage(BuildContext context) async {
    // ignore: deprecated_member_use
    pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        croppedImage = null;
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
      setState(() {
        croppedImage = croppedImage;
      });
    }
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
      return CircleAvatar(
        child: FlatButton(
          child: Text(''),
          onPressed: () {
            _showMyDialog(context);
          },
        ),
        backgroundImage: FileImage(croppedImage),
        radius: 100,
      );
    } else {
      return CircleAvatar(
        child: FlatButton(
          child: Text(''),
          onPressed: () {
            _showMyDialog(context);
          },
        ),
        backgroundColor: Colors.black,
        backgroundImage: AssetImage(kDefaultImage),
        radius: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'User Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage(
                  'background.jpg',
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '  Enter Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            autocorrect: true,
                            maxLength: 30,
                            autofocus: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("hello");
                      },
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
          ),
        ],
      ),
    );
  }
}
