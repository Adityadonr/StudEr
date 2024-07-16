import 'package:flutter/material.dart';
import 'Teacher/TeacherHomePage.dart';
import 'Teacher/TeacherHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeacherHomePage(),
    );
  }
}
