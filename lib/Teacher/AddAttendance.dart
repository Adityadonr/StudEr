import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddAttendance extends StatefulWidget {
  @override
  _AddAttendanceState createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  final _formKey = GlobalKey<FormState>();
  String _attendanceDate = '';
  String _standard = '1';
  String _division = 'A';

  List<Map<String, dynamic>> _students = [
    {'name': 'Student 1', 'present': false},
    {'name': 'Student 2', 'present': false},
    {'name': 'Student 3', 'present': false},
  ];

  @override
  void initState() {
    super.initState();
    _attendanceDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _attendanceDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 16.0;
    final TextStyle textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendance'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Attendance Date'),
                    style: textStyle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select the attendance date';
                      }
                      return null;
                    },
                    controller: TextEditingController(text: _attendanceDate),
                    onSaved: (value) {
                      _attendanceDate = value!;
                    },
                  ),
                ),
              ),
              SizedBox(height: spacing),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _standard,
                      decoration: InputDecoration(labelText: 'Standard'),
                      items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _standard = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a standard';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: spacing),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _division,
                      decoration: InputDecoration(labelText: 'Division'),
                      items: ['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _division = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a division';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),
              Text(
                'Mark Attendance',
                style: textStyle,
              ),
              SizedBox(height: spacing),
              ..._students.map((student) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: spacing / 2),
                  child: Padding(
                    padding: EdgeInsets.all(spacing),
                    child: CheckboxListTile(
                      title: Text(student['name']),
                      value: student['present'],
                      onChanged: (bool? value) {
                        setState(() {
                          student['present'] = value!;
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: spacing),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission (e.g., send data to server)
                    print('Form submitted:');
                    print('Attendance Date: $_attendanceDate');
                    print('Standard: $_standard');
                    print('Division: $_division');
                    print('Students: $_students');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
