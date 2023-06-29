import 'package:drift/drift.dart';
import 'package:expense_tracker_client/core/configs/drift/tables/funds_table.dart';
import 'package:expense_tracker_client/core/configs/drift/tables/transactions_table.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get fundId => integer().references(Funds, #id)();
  IntColumn get transactionId => integer().references(Transactions, #id)();
  TextColumn get financialType => textEnum<FinancialTypeEnum>()();
}
