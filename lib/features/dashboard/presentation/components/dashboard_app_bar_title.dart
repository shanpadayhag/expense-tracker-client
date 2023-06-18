import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPageAppBarTitle extends StatelessWidget {
  final double expenses;

  const DashboardPageAppBarTitle({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyUtil = Get.find<CurrencyUtil>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Today: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          currencyUtil.amountToCurrencyFormat(expenses, CurrencyNameEnum.php),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
