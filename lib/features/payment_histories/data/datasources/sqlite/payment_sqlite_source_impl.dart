import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/features/payment_histories/data/models/payment_model.dart';
import 'package:expense_tracker_client/features/payment_histories/data/protocols/datasources/sqlite/payment_sqlite_source.dart';

class PaymentSQLiteSourceImpl implements PaymentSQLiteSource {
  final DriftDB database;

  PaymentSQLiteSourceImpl({
    required this.database,
  });

  @override
  Future<PaymentModel> addPayment(PaymentModel payment) async {
    try {
      final id = await database.into(database.payments).insert(
          PaymentsCompanion.insert(
              fundId: payment.fund!.id!,
              transactionId: payment.transaction!.id!,
              financialType: payment.financialType));

      return PaymentModel(
        id: id,
        amount: payment.amount,
        financialType: payment.financialType,
      );
    } on Exception {
      throw SQLiteException();
    }
  }
}
