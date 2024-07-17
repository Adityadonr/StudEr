import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddResult extends StatefulWidget {
  @override
  _AddResultState createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  final _formKey = GlobalKey<FormState>();
  String _standard = '1';
  String _division = 'A';
  String _examDate = '';
  String _subject = '';
  final List<String> _standards = List<String>.generate(10, (index) => (index + 1).toString());
  final List<String> _divisions = ['A', 'B', 'C', 'D'];
  final List<String> _subjects = ['Math', 'Science', 'English', 'History']; // Example subjects
  final List<Map<String, dynamic>> _students = [
    {'name': 'John Doe', 'marks': ''},
    {'name': 'Jane Doe', 'marks': ''},
    // Add more students here
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _examDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Standard'),
                      value: _standard,
                      items: _standards.map((String standard) {
                        return DropdownMenuItem<String>(
                          value: standard,
                          child: Text(standard),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _standard = value!;
                        });
                      },
                      onSaved: (value) {
                        _standard = value!;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Division'),
                      value: _division,
                      items: _divisions.map((String division) {
                        return DropdownMenuItem<String>(
                          value: division,
                          child: Text(division),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _division = value!;
                        });
                      },
                      onSaved: (value) {
                        _division = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Exam Date'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select the exam date';
                            }
                            return null;
                          },
                          controller: TextEditingController(text: _examDate),
                          onSaved: (value) {
                            _examDate = value!;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Subject'),
                      value: _subject.isNotEmpty ? _subject : null,
                      items: _subjects.map((String subject) {
                        return DropdownMenuItem<String>(
                          value: subject,
                          child: Text(subject),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _subject = value!;
                        });
                      },
                      onSaved: (value) {
                        _subject = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ..._students.map((student) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(student['name']),
                    trailing: Container(
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Marks',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          student['marks'] = value;
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission (e.g., send data to server)
                    print('Form submitted:');
                    print('Standard: $_standard');
                    print('Division: $_division');
                    print('Exam Date: $_examDate');
                    print('Subject: $_subject');
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
