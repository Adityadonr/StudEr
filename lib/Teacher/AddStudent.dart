import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studer/custom_app_bar.dart';
import 'package:studer/Teacher/TeacherDrawer.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _parentNameController = TextEditingController();
  final _parentPhoneController = TextEditingController();
  final _parentEmailController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _rollNumberController = TextEditingController();
  File? _image;

  DateTime? _dob;
  String? _gender;
  String? _class;
  String? _division;
  String? _relation;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _dob) {
      setState(() {
        _dob = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Student'),
      drawer: TeacherDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextFormField(_fullNameController, 'Full Name', TextInputType.text),
              GestureDetector(
                onTap: () => _selectDateOfBirth(context),
                child: AbsorbPointer(
                  child: buildTextFormField(
                    TextEditingController(text: _dob == null ? '' : _dob.toString().split(' ')[0]),
                    'Date of Birth',
                    TextInputType.datetime,
                    hintText: 'YYYY-MM-DD',
                  ),
                ),
              ),
              buildDropdownButtonFormField('Gender', ['Male', 'Female', 'Other'], _gender, (value) => setState(() => _gender = value)),
              buildDropdownButtonFormField('Class', List.generate(10, (index) => (index + 1).toString()), _class, (value) => setState(() => _class = value)),
              buildDropdownButtonFormField('Division', ['A', 'B', 'C', 'D'], _division, (value) => setState(() => _division = value)),
              buildTextFormField(_rollNumberController, 'Roll Number', TextInputType.number),
              buildTextFormField(_addressController, 'Address', TextInputType.text, maxLines: 3),
              buildTextFormField(_parentNameController, 'Full Name of Parent/Guardian', TextInputType.text),
              buildTextFormField(_parentPhoneController, 'Parent Phone Number', TextInputType.phone),
              buildTextFormField(_parentEmailController, 'Parent Email Address', TextInputType.emailAddress),
              buildDropdownButtonFormField('Relation to Student', ['Mother', 'Father', 'Guardian'], _relation, (value) => setState(() => _relation = value)),
              buildTextFormField(_emergencyContactController, 'Emergency Contact Information', TextInputType.phone),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Capture Student Picture'),
              ),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                    print('Full Name: ${_fullNameController.text}');
                    print('Date of Birth: ${_dob}');
                    print('Gender: $_gender');
                    print('Class: $_class');
                    print('Division: $_division');
                    print('Roll Number: ${_rollNumberController.text}');
                    print('Address: ${_addressController.text}');
                    print('Full Name of Parent: ${_parentNameController.text}');
                    print('Parent Phone Number: ${_parentPhoneController.text}');
                    print('Parent Email Address: ${_parentEmailController.text}');
                    print('Relation to Student: $_relation');
                    print('Emergency Contact Information: ${_emergencyContactController.text}');
                    if (_image != null) {
                      print('Student Picture: ${_image!.path}');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Submitted Successfully')));
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

  Widget buildTextFormField(TextEditingController controller, String label, TextInputType keyboardType, {String? hintText, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the $label';
        } else if (keyboardType == TextInputType.phone && value.length != 10) {
          return 'Please enter a valid 10-digit phone number';
        } else if (keyboardType == TextInputType.emailAddress && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget buildDropdownButtonFormField(String label, List<String> items, String? value, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: items.map((label) => DropdownMenuItem(
        child: Text(label),
        value: label,
      )).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select a $label';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _parentNameController.dispose();
    _parentPhoneController.dispose();
    _parentEmailController.dispose();
    _emergencyContactController.dispose();
    _rollNumberController.dispose();
    super.dispose();
  }
}
