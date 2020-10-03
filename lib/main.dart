import 'package:flutter/material.dart';
import 'package:tepdmission1/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NicklausFW',
      theme: ThemeData(
        primaryColor: Color(0xFFb83b5e),
        backgroundColor: Color(0xFFff9966),
        fontFamily: "Assistant",
      ),
      home: HomeScreen(),
    );
  }
}
