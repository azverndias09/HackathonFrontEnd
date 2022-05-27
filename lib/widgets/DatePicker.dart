import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthPicker extends StatelessWidget {
  BirthPicker({Key? key}) : super(key: key);
  final DateTime date = DateTime.now();
  String formattedDate = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          DateTime? _dob = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(_dob!);
        },
        child: Text("DOB"));
  }
}
