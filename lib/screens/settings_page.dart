import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ieeeapp/widgets/input_field.dart';
import 'package:image_picker/image_picker.dart';


class SettingsScreen extends StatefulWidget {
  static String id = "SettingsScreen";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File _image;


  @override
  Widget build(BuildContext context) {
    Future getImageFromCamera() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
      });
    }

    Future getImageFromGallery() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

    Future<void> _showChoiceDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select Your Choise'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('🖼 Pick from gallery'),
                      onTap: () {
                        getImageFromGallery();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: GestureDetector(
                        child: Text('📷 Take picture'),
                        onTap: () {
                          getImageFromCamera();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100.0,
                        child: ClipOval(
                          child: SizedBox(
                              height: 180.0,
                              width: 180.0,
                              child: _image == null
                                  ? Center(
                                child: Text(
                                  'Add a Photo',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0),
                                ),
                              )
                                  : Image.file(
                                _image,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 100.0,
                    ),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _showChoiceDialog();
                      },
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.blue[300],
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: inputField('Name'),
              ),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    elevation: 6.0,
                    padding: EdgeInsets.only(
                        left: 25.0, top: 10.0, bottom: 10.0, right: 25.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.grey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                  ),
                  RaisedButton(
                    elevation: 6.0,
                    padding: EdgeInsets.only(
                        left: 25.0, top: 10.0, bottom: 10.0, right: 25.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
