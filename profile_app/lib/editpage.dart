import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profileapp/Variables.dart';

class EditPage extends StatefulWidget {
  static const String id = 'EditPage';
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final myController1 = TextEditingController();
  final myController5 = TextEditingController();

  @override
  void _sendDataBack(BuildContext context) {
    String textToSendBack = 'refresh';
    Navigator.pop(context, textToSendBack);
  }

  File _image;
  String path;

  Future<void> imagepick() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        imported = _image;
      });
    });
    path = _image.path;
    setState(() {
      propic = path;
      pic = true;
    });
  }

  void dispose() {
    myController1.dispose();
    myController5.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double opacity = 0;
    setState(() {
      opacity = .6;
    });
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/hai3.png"),
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                GestureDetector(
                  onTap: () {
                    imagepick();
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(90)),
                      depth: 2,
                      lightSource: LightSource.topLeft,
                      color: NeumorphicColors.background,
                    ),
                    child: Container(
                      width: 170,
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage:
                              pic ? FileImage(imported) : AssetImage(propic),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Tap the image to change picture",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "NAME",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -4,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(30.0),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: name),
                      onChanged: (String value) {
                        name = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Neumorphic(
                  child: FlatButton(
                    child: Text("Save"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
