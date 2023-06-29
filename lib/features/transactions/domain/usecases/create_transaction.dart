import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/core/utils/generation_utils.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/entities/payment.dart';
import 'package:expense_tracker_client/features/payment_histories/domain/repositories/payment_repository.dart';
import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';
import 'package:expense_tracker_client/features/transactions/domain/repositories/transaction_repository.dart';

class CreateTransactionParams extends Equatable {
  final String transactionTitle;
  final double paymentAmount;
  final FinancialTypeEnum paymentType;
  final String fundName;

  const CreateTransactionParams({
    required this.transactionTitle,
    required this.paymentAmount,
    required this.paymentType,
    required this.fundName,
  });

  @override
  List<Object?> get props =>
      [transactionTitle, paymentAmount, paymentType, fundName];
}

class CreateTransaction extends UseCase<Transaction, CreateTransactionParams> {
  final TransactionRepository transactionRepository;
  final FundRepository fundRepository;
  final PaymentRepository paymentRepository;
  final GenerationUtils generationUtils;

  CreateTransaction({
    required this.transactionRepository,
    required this.fundRepository,
    required this.paymentRepository,
    required this.generationUtils,
  });

  @override
  Future<Either<Failure, Transaction>> execute(
      CreateTransactionParams params) async {
    final fundEither =
        await fundRepository.upsertFund(Fund(name: params.fundName));

    Either<Failure, Transaction> result = await fundEither.fold(
      (failure) => Left(failure),
      (fund) async {
        final transactionEither = await transactionRepository.addTransaction(
            Transaction(
                title: params.transactionTitle,
                code: generationUtils.generateCode()));

        return transactionEither.fold(
          (failure) => Left(failure),
          (transaction) async {
            final paymentEither = await paymentRepository.addPayment(Payment(
                transaction: transaction,
                amount: params.paymentAmount,
                financialType: params.paymentType,
                fund: fund));

            return paymentEither.fold(
              (failure) => Left(failure),
              (payment) => Right(
                Transaction(
                  title: transaction.title,
                  code: transaction.code,
                  id: transaction.id,
                ),
              ),
            );
          },
        );
      },
    );

    return result;
  }
}
