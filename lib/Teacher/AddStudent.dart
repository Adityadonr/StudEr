import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _dateOfBirth = '';
  String _gender = 'Male'; // Default value
  String _address = '';
  String _standard = '1'; // Default value
  String _division = 'A'; // Default value
  String _rollNumber = '';
  String _parentName = '';
  String _relationship = 'Mother'; // Default value
  String _parentPhoneNumber = '';
  String _parentEmail = '';
  String _emergencyContact = '';

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _standards = List<String>.generate(10, (index) => (index + 1).toString());
  final List<String> _divisions = ['A', 'B', 'C', 'D'];
  final List<String> _relationships = ['Mother', 'Father', 'Brother', 'Spouse'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateOfBirth = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the full name';
                  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Only characters are allowed';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Date of Birth'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select the date of birth';
                            }
                            return null;
                          },
                          controller: TextEditingController(text: _dateOfBirth),
                          onSaved: (value) {
                            _dateOfBirth = value!;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Gender'),
                      value: _gender,
                      items: _genders.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                      onSaved: (value) {
                        _gender = value!;
                      },
                    ),
                  ),
                ],
              ),
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
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Roll Number'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the roll number';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only integers are allowed';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _rollNumber = value!;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                maxLength: 200,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name of Parent/Guardian'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the full name of parent/guardian';
                  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Only characters are allowed';
                  }
                  return null;
                },
                onSaved: (value) {
                  _parentName = value!;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Relationship to Student'),
                value: _relationship,
                items: _relationships.map((String relationship) {
                  return DropdownMenuItem<String>(
                    value: relationship,
                    child: Text(relationship),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _relationship = value!;
                  });
                },
                onSaved: (value) {
                  _relationship = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Parent/Guardian Phone Number'),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the parent/guardian phone number';
                  } else if (value.length != 10) {
                    return 'Phone number must be 10 digits';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Only integers are allowed';
                  }
                  return null;
                },
                onSaved: (value) {
                  _parentPhoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Parent/Guardian Email Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the parent/guardian email address';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _parentEmail = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Emergency Contact Information'),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the emergency contact information';
                  } else if (value.length != 10) {
                    return 'Phone number must be 10 digits';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Only integers are allowed';
                  }
                  return null;
                },
                onSaved: (value) {
                  _emergencyContact = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission (e.g., send data to server)
                    print('Form submitted:');
                    print('Full Name: $_fullName');
                    print('Date of Birth: $_dateOfBirth');
                    print('Gender: $_gender');
                    print('Address: $_address');
                    print('Standard: $_standard');
                    print('Division: $_division');
                    print('Roll Number: $_rollNumber');
                    print('Parent Name: $_parentName');
                    print('Relationship: $_relationship');
                    print('Parent Phone Number: $_parentPhoneNumber');
                    print('Parent Email: $_parentEmail');
                    print('Emergency Contact: $_emergencyContact');
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
