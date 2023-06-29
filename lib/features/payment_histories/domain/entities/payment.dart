import 'package:equatable/equatable.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';

class Payment extends Equatable {
  final int? id;
  final double amount;
  final FinancialTypeEnum financialType;
  final Transaction? transaction;
  final Fund? fund;

  const Payment({
    this.id,
    required this.amount,
    required this.financialType,
    this.transaction,
    this.fund,
  });

  @override
  List<Object?> get props => [amount, financialType, transaction, fund];
}
