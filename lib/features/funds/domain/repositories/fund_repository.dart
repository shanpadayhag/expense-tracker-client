import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';

abstract class FundRepository {
  Future<Either<Failure, List<Fund>>> getFunds();
  Future<Either<Failure, Fund>> addFund(Fund params);
  Future<Either<Failure, Fund>> updateFund();
  Future<Either<Failure, Fund>> deleteFund();
  Future<Either<Failure, Fund>> upsertFund(Fund fund);
}
