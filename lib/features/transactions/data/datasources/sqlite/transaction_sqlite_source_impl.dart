import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/features/transactions/data/models/transaction_model.dart';
import 'package:expense_tracker_client/features/transactions/data/protocols/datasources/sqlite/transaction_sqlite_source.dart';

class TransactionSQLiteSourceImpl implements TransactionSQLiteSource {
  final DriftDB database;

  TransactionSQLiteSourceImpl({required this.database});

  @override
  Future<TransactionModel> addTransaction(TransactionModel transaction) async {
    try {
      final transactionId = await database.into(database.transactions).insert(
          TransactionsCompanion.insert(
              code: transaction.code!, title: transaction.title));

      return TransactionModel(title: transaction.title, id: transactionId);
    } on Exception {
      throw SQLiteException();
    }
  }
}
