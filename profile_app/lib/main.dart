import 'package:flutter/material.dart';
import 'package:profileapp/editpage.dart';
import 'package:profileapp/firstpage.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirstPage.id,
      routes: {
        FirstPage.id: (context) => FirstPage(),
        EditPage.id: (context) => EditPage()
      },
    );
  }
}
