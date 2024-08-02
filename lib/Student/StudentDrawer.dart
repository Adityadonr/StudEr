import 'package:flutter/material.dart';
import 'package:studer/Student/Notifications.dart'; // Import the StudentNotifications page

class StudentDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Student Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Student Dashboard
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
          ListTile(
            title: Text('Homework'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Homework page
            },
          ),
          ListTile(
            title: Text('Results'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Results page
            },
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Feedback page
            },
          ),
          ListTile(
            title: Text('Apply Leave'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Apply Leave page
            },
          ),
        ],
      ),
    );
  }
}
