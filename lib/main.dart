import 'package:flutter/material.dart';
import 'package:pbl_mobile/ChatScreen.dart';
import 'package:pbl_mobile/ConsultationPage.dart';
import 'package:pbl_mobile/data/homescreen.dart';
import 'package:pbl_mobile/grooming/grooming.dart';
import 'package:pbl_mobile/home.dart';
import 'package:pbl_mobile/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
      // routes: {'/home': (context) => HomePage()},
    );
  }
}
