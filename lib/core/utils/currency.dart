import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:intl/intl.dart';

class Currency {
  static String getSymbol(CurrencyNameEnum currencyName) {
    return NumberFormat.simpleCurrency(name: currencyName.value).currencySymbol;
  }
}
