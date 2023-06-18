import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonthSavings extends StatelessWidget {
  final currencyUtil = Get.find<CurrencyUtil>();
  final double savingsAmount;

  MonthSavings({
    Key? key,
    required this.savingsAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('March Savings'),
        Text(currencyUtil.amountToCurrencyFormat(
            savingsAmount, CurrencyNameEnum.php))
      ],
    );
  }
}
