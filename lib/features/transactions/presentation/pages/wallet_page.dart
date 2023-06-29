import 'package:expense_tracker_client/core/layouts/user_default_layout.dart';
import 'package:expense_tracker_client/features/funds/presentation/components/fund_balance.dart';
import 'package:expense_tracker_client/features/transactions/presentation/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);

  final controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return UserDefaultLayout(
        appBarTitle: const Text('Wallet'),
        child: Column(
          children: [
            Row(
                children: controller.funds
                    .map((fund) => FundBalance(fundName: fund.name))
                    .toList()),
            TextFormField(
                controller: controller.fundNameTextController,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Fund Name')),
            TextFormField(
                controller: controller.transactionNameTextController,
                decoration:
                    const InputDecoration(hintText: 'Transaction Name')),
            TextFormField(
                controller: controller.paymentAmountTextController,
                decoration: const InputDecoration(hintText: 'Payment Amount')),
            ElevatedButton(
                onPressed: controller.addTransaction,
                child: const Text('Submit'))
          ],
        ));
  }
}
