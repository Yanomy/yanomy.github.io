import 'package:intl/intl.dart';

class DateTimeUtil {
  static final DateFormat _datetimeFormat = DateFormat('yyyy-MM-dd hh:mm');
  static final DateFormat _yearMonthFormat = DateFormat('MMM yyyy');

  DateTimeUtil._();

  static String formatDatetime(DateTime datetime) {
    return _datetimeFormat.format(datetime);
  }

  static String formatYearMonth(DateTime datetime) {
    return _yearMonthFormat.format(datetime);
  }

  static String different(DateTime start, [DateTime? end]) {
    end ??= DateTime.now();
    int yearDiff = end.year - start.year;
    int monthDiff = end.month - start.month+1;
    if (monthDiff < 0) {
      yearDiff--;
      monthDiff += 12;
    }

    if(yearDiff == 0){
      return "$monthDiff mos";
    }

    if(monthDiff ==0){
      return "$yearDiff yrs";
    }
    return "$yearDiff yrs $monthDiff mos";
  }
}
