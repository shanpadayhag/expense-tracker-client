import 'package:expense_tracker_client/core/components/segment_control/segment_control.dart';
import 'package:expense_tracker_client/core/components/segment_control/segment_control_child.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/layouts/user_default_layout.dart';
import 'package:expense_tracker_client/features/calculations/presentation/components/month_savings.dart';
import 'package:expense_tracker_client/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:expense_tracker_client/features/dashboard/presentation/components/dashboard_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return UserDefaultLayout(
        appBarTitle: const DashboardPageAppBarTitle(expenses: 1234.56),
        child: Wrap(
          runSpacing: 20,
          children: [
            Row(children: [
              Expanded(
                  child: GetBuilder<DashboardController>(
                      builder: (_) => SegmentControl(
                              value: controller.financialType.name,
                              onValueChanged: controller.setFinancialType,
                              children: [
                                SegmentControlChild(
                                  value: FinancialTypeEnum.spend.name,
                                  label: FinancialTypeEnum.spend.label,
                                ),
                                SegmentControlChild(
                                  value: FinancialTypeEnum.earned.name,
                                  label: FinancialTypeEnum.earned.label,
                                ),
                              ]))),
            ]),
            Row(children: [Expanded(child: MonthSavings(savingsAmount: 7456))]),
          ],
        ));
  }
}
