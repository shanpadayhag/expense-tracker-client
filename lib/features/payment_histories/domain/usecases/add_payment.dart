import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/repositories/payment_repository.dart';

class AddPayment extends UseCase<Payment, Payment> {
  final PaymentRepository repository;

  AddPayment({
    required this.repository,
  });

  @override
  Future<Either<Failure, Payment>> execute(Payment payment) {
    return repository.addPayment(payment);
  }
}
