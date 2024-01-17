import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String getFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
