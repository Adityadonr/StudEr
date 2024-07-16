import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNotification extends StatefulWidget {
  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  final _formKey = GlobalKey<FormState>();
  String _notificationTitle = '';
  String _notificationContent = '';
  String _notificationDate = '';
  String _standard = 'All';
  String _division = 'All';
  String _class = 'All';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _notificationDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 16.0;
    final TextStyle textStyle = TextStyle(fontSize: 16.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notification'),
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
                      items: ['All', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
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
                      items: ['All', 'A', 'B', 'C', 'D'].map((String value) {
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
                  SizedBox(width: spacing),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _class,
                      decoration: InputDecoration(labelText: 'Class'),
                      items: ['All', 'Class 1', 'Class 2', 'Class 3', 'Class 4']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _class = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a class';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notification Title'),
                style: textStyle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the notification title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _notificationTitle = value!;
                },
              ),
              SizedBox(height: spacing),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notification Content'),
                style: textStyle,
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the notification content';
                  }
                  return null;
                },
                onSaved: (value) {
                  _notificationContent = value!;
                },
              ),
              SizedBox(height: spacing),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Notification Date'),
                    style: textStyle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select the notification date';
                      }
                      return null;
                    },
                    controller: TextEditingController(text: _notificationDate),
                    onSaved: (value) {
                      _notificationDate = value!;
                    },
                  ),
                ),
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
                    print('Class: $_class');
                    print('Notification Title: $_notificationTitle');
                    print('Notification Content: $_notificationContent');
                    print('Notification Date: $_notificationDate');
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
