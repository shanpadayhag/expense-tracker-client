import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/failures/sqlite_failure.dart';
import 'package:expense_tracker_client/features/payment_histories/data/models/payment_model.dart';
import 'package:expense_tracker_client/features/payment_histories/data/protocols/datasources/sqlite/payment_sqlite_source.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentSQLiteSource sqliteSource;

  PaymentRepositoryImpl({
    required this.sqliteSource,
  });

  @override
  Future<Either<Failure, Payment>> addPayment(Payment payment) async {
    try {
      return Right(
          await sqliteSource.addPayment(PaymentModel.fromEntity(payment)));
    } on SQLiteException {
      return Left(SQLiteFailure());
    }
  }
}
