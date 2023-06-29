import 'package:expense_tracker_client/features/payment_histories/data/models/payment_model.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';

abstract class PaymentSQLiteSource {
  Future<Payment> addPayment(PaymentModel payment);
}
