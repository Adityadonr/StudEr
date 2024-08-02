// lib/student_dashboard.dart
import 'package:flutter/material.dart';
import 'package:studer/Student/StudentDrawer.dart';
import 'package:studer/custom_app_bar.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Student Dashboard'),
      drawer: StudentDrawer(),
      body: Center(
        child: Text('Welcome to the Student Dashboard'),
      ),
    );
  }
}
