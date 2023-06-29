import 'dart:math';

import 'package:expense_tracker_client/core/utils/date_utils.dart';

class GenerationUtils {
  final DateUtils dateUtils;

  GenerationUtils({
    required this.dateUtils,
  });

  String generateCode() {
    return "${dateUtils.codeFormatDate(DateTime.now())}-${generaterRandomString(6)}";
  }

  String generaterRandomString(int length) {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();

    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }
}
