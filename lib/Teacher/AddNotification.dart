import 'package:flutter/material.dart';
import 'package:studer/custom_app_bar.dart';
import 'package:studer/Teacher/TeacherDrawer.dart';

class AddNotification extends StatefulWidget {
  @override
  _AddNotificationState createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  TextEditingController _notificationDateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _notificationDateController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectNotificationDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate.toLocal() != DateTime.now()) {
      setState(() {
        _notificationDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Notification'),
      drawer: TeacherDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Category'),
                value: _selectedCategory,
                items: [
                  'Announcement',
                  'Exam',
                  'Holiday',
                  'Teacher Meeting',
                ].map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Notification Title'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Notification Description'),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _notificationDateController,
                decoration: InputDecoration(labelText: 'Notification Date'),
                readOnly: true,
                onTap: () => _selectNotificationDate(context),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the add notification logic here
                      print('Category: $_selectedCategory');
                      print('Notification Title: ${_titleController.text}');
                      print('Notification Description: ${_descriptionController.text}');
                      print('Notification Date: ${_notificationDateController.text}');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Notification Added')));
                    }
                  },
                  child: Text('Add Notification'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
