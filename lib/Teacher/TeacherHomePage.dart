import 'package:flutter/material.dart';
import 'AddStudent.dart';
import 'AddNotification.dart';
import 'AddAttendance.dart';
import 'AddHomework.dart';
import 'AddResult.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      drawer: Drawer(
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
              leading: Icon(Icons.person_add),
              title: Text('Add Student'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStudent()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Add Notification'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNotification()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Add Attendance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAttendance()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Add Homework'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddHomework()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.grade),
              title: Text('Add Result'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddResult()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Teacher Dashboard!'),
      ),
    );
  }
}
