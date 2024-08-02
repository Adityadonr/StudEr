import 'package:flutter/material.dart';
import 'package:studer/custom_app_bar.dart';
import 'package:studer/Teacher/TeacherDrawer.dart';

class AddHomework extends StatefulWidget {
  @override
  _AddHomeworkState createState() => _AddHomeworkState();
}

class _AddHomeworkState extends State<AddHomework> {
  final _formKey = GlobalKey<FormState>();
  String? selectedClass;
  String? selectedDivision;
  TextEditingController _homeworkDateController = TextEditingController();

  @override
  void dispose() {
    _homeworkDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Homework'),
      drawer: TeacherDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                        });
                      },
                      validator: (value) => value == null ? 'Please select a class' : null,
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
                        });
                      },
                      validator: (value) => value == null ? 'Please select a division' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Homework Title'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Homework Description'),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _homeworkDateController,
                decoration: InputDecoration(labelText: 'Homework Given Date'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _homeworkDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle the add homework logic here
                      print('Homework Added');
                    }
                  },
                  child: Text('Add Homework'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
