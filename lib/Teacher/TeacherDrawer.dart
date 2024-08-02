import 'package:flutter/material.dart';
import 'package:studer/Teacher/AddAttendance.dart';
import 'package:studer/Teacher/AddHomework.dart';
import 'package:studer/Teacher/AddNotification.dart';
import 'package:studer/Teacher/AddStudent.dart';
import 'package:studer/Teacher/TeacherDashboard.dart';

class TeacherDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Teacher Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TeacherDashboard()),
              );
            },
          ),
          ListTile(
            title: Text('Add Attendance'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddAttendance()),
              );
            },
          ),
          ListTile(
            title: Text('Add Homework'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddHomework()),
              );
            },
          ),
          ListTile(
            title: Text('Add Notification'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddNotification()),
              );
            },
          ),
          ListTile(
            title: Text('Add Student'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddStudent()),
              );
            },
          ),
        ],
      ),
    );
  }
}
