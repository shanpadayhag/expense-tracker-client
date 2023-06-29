import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/features/funds/data/models/fund_model.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';
import 'package:expense_tracker_client/features/transactions/data/models/transaction_model.dart';
import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';

class PaymentModel extends Payment {
  const PaymentModel({
    int? id,
    required double amount,
    required FinancialTypeEnum financialType,
    TransactionModel? transaction,
    FundModel? fund,
  }) : super(
          id: id,
          amount: amount,
          financialType: financialType,
          transaction: transaction,
          fund: fund,
        );

  static PaymentModel fromEntity(Payment payment) {
    final fund = payment.fund;

    return PaymentModel(
        id: payment.id,
        amount: payment.amount,
        financialType: payment.financialType,
        transaction: payment.transaction is Transaction
            ? TransactionModel.fromEntity(payment.transaction!)
            : null,
        fund: fund is Fund ? FundModel.fromEntity(fund) : null);
  }
}
