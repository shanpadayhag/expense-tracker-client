import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';

abstract class PaymentRepository {
  Future<Either<Failure, Payment>> addPayment(Payment payment);
}
