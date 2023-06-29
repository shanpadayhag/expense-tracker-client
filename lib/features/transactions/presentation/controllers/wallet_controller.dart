import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';
import 'package:expense_tracker_client/features/transactions/domain/usecases/create_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  final CreateTransaction createTransaction;

  WalletController({
    required this.createTransaction,
  });

  final fundNameTextController = TextEditingController(text: "Test");
  final transactionNameTextController = TextEditingController(text: "Test");
  final paymentAmountTextController = TextEditingController(text: "1");

  final List<Fund> funds = [];

  void addTransaction() async {
    final createdTransaction = await createTransaction.execute(
        CreateTransactionParams(
            transactionTitle: transactionNameTextController.text,
            paymentAmount: double.parse(paymentAmountTextController.text),
            paymentType: FinancialTypeEnum.spend,
            fundName: fundNameTextController.text));

    createdTransaction.fold(
      __failedAddTransactionHandler,
      __successAddTransactionHandler,
    );
  }

  void __successAddTransactionHandler(Transaction transaction) {
    print('Success');
  }

  void __failedAddTransactionHandler(Failure failure) {
    print('Unsuccessful');
  }
}
