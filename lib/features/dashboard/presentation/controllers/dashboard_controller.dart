import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/utils/enum_utils.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final EnumUtil enumUtil;

  DashboardController({required this.enumUtil});

  var financialType = FinancialTypeEnum.spend;

  void setFinancialType(String? type) {
    financialType =
        enumUtil.getEnumValueFromString(FinancialTypeEnum.values, type);
    update();
  }
}
