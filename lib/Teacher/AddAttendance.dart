import 'package:flutter/material.dart';
import 'package:studer/custom_app_bar.dart';
import 'package:studer/Teacher/TeacherDrawer.dart';

class AddAttendance extends StatefulWidget {
  @override
  _AddAttendanceState createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  String? selectedClass;
  String? selectedDivision;
  List<bool> attendanceStatus = List.generate(10, (_) => false);  // Default attendance status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Attendance'),
      drawer: TeacherDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Class'),
                    value: selectedClass,
                    items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                        .map((classNumber) => DropdownMenuItem<String>(
                      value: classNumber,
                      child: Text(classNumber),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value;
                        // Reload student list based on the selected class
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Division'),
                    value: selectedDivision,
                    items: ['A', 'B', 'C', 'D']
                        .map((division) => DropdownMenuItem<String>(
                      value: division,
                      child: Text(division),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDivision = value;
                        // Reload student list based on the selected division
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // Replace with the actual count of students
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student ${index + 1}'),  // Replace with actual student names
                    trailing: Checkbox(
                      value: attendanceStatus[index],
                      onChanged: (bool? value) {
                        setState(() {
                          attendanceStatus[index] = value ?? false;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the add attendance logic here
                },
                child: Text('Submit Attendance'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
