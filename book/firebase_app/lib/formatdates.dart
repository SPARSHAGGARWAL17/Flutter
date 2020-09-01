import 'export.dart';

class FormatDates {
  String datesFormatMonthDayYear(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  String datesFormatDay(String date) {
    return DateFormat.d().format(DateTime.parse(date));
  }

  String datesFormatDayNumber(String date) {
    return DateFormat.E().format(DateTime.parse(date));
  }
}
