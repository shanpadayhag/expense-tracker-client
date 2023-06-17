import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/funds/domain/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';

class AddFund implements UseCase<Fund, Fund> {
  final FundRepository repository;

  AddFund(this.repository);

  @override
  Future<Either<Failure, Fund>> execute(Fund params) async {
    return repository.addFund(params);
  }
}
