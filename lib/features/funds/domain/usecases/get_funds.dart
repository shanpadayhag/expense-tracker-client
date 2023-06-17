import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/funds/domain/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';

class GetFundsParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFunds implements UseCase<List<Fund>, GetFundsParams> {
  final FundRepository repository;

  GetFunds(this.repository);

  @override
  Future<Either<Failure, List<Fund>>> execute(GetFundsParams params) async {
    return await repository.getFunds();
  }
}
