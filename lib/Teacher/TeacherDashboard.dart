// lib/teacher_dashboard.dart
import 'package:flutter/material.dart';
import 'package:studer/Teacher/TeacherDrawer.dart';
import 'package:studer/custom_app_bar.dart';

class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Teacher Dashboard'),
      drawer: TeacherDrawer(),
      body: Center(
        child: Text('Welcome to the Teacher Dashboard'),
      ),
    );
  }
}
