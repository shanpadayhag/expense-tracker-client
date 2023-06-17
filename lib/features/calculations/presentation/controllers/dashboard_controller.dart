import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/utils/enum_utils.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var financialType = FinancialTypeEnum.expense;

  void setFinancialType(String? type) {
    financialType =
        EnumUtils.getEnumValueFromString(FinancialTypeEnum.values, type);
    update();
  }
}
