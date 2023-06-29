import 'package:intl/intl.dart';

class DateUtils {
  String humanFormatDate(DateTime dateTime) {
    final dateTimeFormat = DateFormat('MMMM dd, yyyy');
    return dateTimeFormat.format(dateTime);
  }

  String humanFormatDateTime(DateTime dateTime) {
    final dateTimeFormat = DateFormat('MMMM dd, yyyy @ h:mm a');
    return dateTimeFormat.format(dateTime);
  }

  String humanFormatTime(DateTime dateTime) {
    final dateTimeFormat = DateFormat('h:mm a');
    return dateTimeFormat.format(dateTime);
  }

  String dataFormatDateTime(DateTime dateTime) {
    final dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    return dateTimeFormat.format(dateTime);
  }

  String codeFormatDate(DateTime dateTime) {
    final dateTimeFormat = DateFormat('MMddyy');
    return dateTimeFormat.format(dateTime);
  }
}
