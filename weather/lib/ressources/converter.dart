import 'package:intl/intl.dart';

class ConvertionHelper {
  // Timestamp to Date Converter
  static String parseTimeStamp(int timeStamp, String format
  ) {
    var paresedDate = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var date = DateFormat(format).format(paresedDate);
    return date;
  }
}
