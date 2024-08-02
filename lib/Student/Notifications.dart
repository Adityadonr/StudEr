import 'package:flutter/material.dart';
import 'package:studer/custom_app_bar.dart';
import 'package:studer/Student/StudentDrawer.dart';

class Notifications extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'date': '2024-07-23',
      'title': 'Holiday Announcement',
      'description': 'The school will remain closed on 24th July due to maintenance work.',
      'category': 'Holiday'
    },
    {
      'date': '2024-07-23',
      'title': 'Special Assembly',
      'description': 'There will be a special assembly on 24th July to honor outstanding students.',
      'category': 'Announcement'
    },
    {
      'date': '2024-07-22',
      'title': 'Exam Schedule',
      'description': 'The final exam schedule has been released. Please check the notice board for details.',
      'category': 'Exam'
    },
    // Add more notifications as needed
  ];

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Holiday':
        return Colors.green;
      case 'Exam':
        return Colors.red;
      case 'Announcement':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Set<String> displayedDates = {};
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      drawer: StudentDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            bool showDate = !displayedDates.contains(notifications[index]['date']);
            if (showDate) {
              displayedDates.add(notifications[index]['date']!);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDate)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        notifications[index]['date']!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  Card(
                    elevation: 3,
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 80,
                          color: getCategoryColor(notifications[index]['category']!),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notifications[index]['title']!,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(notifications[index]['description']!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
