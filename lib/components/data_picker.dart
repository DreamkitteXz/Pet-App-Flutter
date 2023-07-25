//Data Picker
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime? _selectedDate;

String formatDateToString(DateTime? date) {
  if (date == null) return '';
  return DateFormat('dd/MM/yyyy').format(date);
}

Future<DateTime?> _showDataPicker(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );

  return picked;
}
