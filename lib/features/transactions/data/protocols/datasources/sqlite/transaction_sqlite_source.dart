import 'package:expense_tracker_client/features/transactions/data/models/transaction_model.dart';

abstract class TransactionSQLiteSource {
  Future<TransactionModel> addTransaction(TransactionModel transaction);
}
