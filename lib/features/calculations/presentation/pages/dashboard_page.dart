import 'package:expense_tracker_client/core/components/segment_control/segment_control.dart';
import 'package:expense_tracker_client/core/components/segment_control/segment_control_child.dart';
import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/layouts/user_default_layout.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:expense_tracker_client/features/calculations/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return UserDefaultLayout(
      appBarTitle: const _DashboardPageAppBarTitle(expenses: 1234.56),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GetBuilder<DashboardController>(
                  builder: (_) => SegmentControl(
                    value: controller.financialType.name,
                    onValueChanged: controller.setFinancialType,
                    children: [
                      SegmentControlChild(
                        value: FinancialTypeEnum.expense.name,
                        label: FinancialTypeEnum.expense.label,
                      ),
                      SegmentControlChild(
                        value: FinancialTypeEnum.income.name,
                        label: FinancialTypeEnum.income.label,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardPageAppBarTitle extends StatelessWidget {
  final double expenses;

  const _DashboardPageAppBarTitle({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Today: ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          '${CurrencyUtils.getSymbol(CurrencyNameEnum.php)}${expenses.toString()}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
