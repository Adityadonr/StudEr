import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddHomework extends StatefulWidget {
  @override
  _AddHomeworkState createState() => _AddHomeworkState();
}

class _AddHomeworkState extends State<AddHomework> {
  final _formKey = GlobalKey<FormState>();
  String _standard = '1';
  String _division = 'A';
  String _subject = '';
  String _dueDate = '';
  String _homeworkDescription = '';

  @override
  void initState() {
    super.initState();
    _dueDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dueDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 16.0;
    final TextStyle textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Homework'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Subject'),
                style: textStyle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
                onSaved: (value) {
                  _subject = value!;
                },
              ),
              SizedBox(height: spacing),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Due Date'),
                    style: textStyle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select the due date';
                      }
                      return null;
                    },
                    controller: TextEditingController(text: _dueDate),
                    onSaved: (value) {
                      _dueDate = value!;
                    },
                  ),
                ),
              ),
              SizedBox(height: spacing),
              TextFormField(
                decoration: InputDecoration(labelText: 'Homework Description'),
                style: textStyle,
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the homework description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _homeworkDescription = value!;
                },
              ),
              SizedBox(height: spacing),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission (e.g., send data to server)
                    print('Form submitted:');
                    print('Standard: $_standard');
                    print('Division: $_division');
                    print('Subject: $_subject');
                    print('Due Date: $_dueDate');
                    print('Homework Description: $_homeworkDescription');
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
