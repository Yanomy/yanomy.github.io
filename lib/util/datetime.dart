import 'package:intl/intl.dart';

class DatetimeUtil {
  static final DateFormat _datetimeFormat = DateFormat('yyyy-MM-dd hh:mm');

  DatetimeUtil._();

  static String formatDatetime(DateTime datetime) {
    return _datetimeFormat.format(datetime);
  }
}
