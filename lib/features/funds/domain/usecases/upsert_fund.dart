import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/core/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';

class UpsertFund implements UseCase<Fund, Fund> {
  final FundRepository repository;

  UpsertFund(this.repository);

  @override
  Future<Either<Failure, Fund>> execute(Fund fund) async {
    return repository.upsertFund(fund);
  }
}
