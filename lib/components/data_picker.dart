//Data Picker
import 'package:intl/intl.dart';

String formatDateToString(DateTime? date) {
  if (date == null) return '';
  return DateFormat('dd/MM/yyyy').format(date);
}
