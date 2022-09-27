import 'package:intl/intl.dart';

class ConversionHelper {
  // Timestamp to Date Converter
  static String parseTimeStamp(int timeStamp, String format
  ) {
    var parsedDate = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var date = DateFormat(format).format(parsedDate);
    return date;
  }
}
