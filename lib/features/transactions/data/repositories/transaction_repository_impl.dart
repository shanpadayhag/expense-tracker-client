import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/failures/sqlite_failure.dart';
import 'package:expense_tracker_client/features/transactions/data/models/transaction_model.dart';
import 'package:expense_tracker_client/features/transactions/data/protocols/datasources/sqlite/transaction_sqlite_source.dart';
import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';
import 'package:expense_tracker_client/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionSQLiteSource sqliteSource;

  TransactionRepositoryImpl({
    required this.sqliteSource,
  });

  @override
  Future<Either<Failure, Transaction>> addTransaction(
      Transaction transaction) async {
    try {
      return Right(await sqliteSource
          .addTransaction(TransactionModel.fromEntity(transaction)));
    } on SQLiteException {
      return Left(SQLiteFailure());
    }
  }
}
