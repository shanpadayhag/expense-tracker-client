import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/usecases/use_case.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund_balance.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';

class GetFundBalances extends UseCaseNoParams<List<FundBalance>> {
  FundRepository repository;

  GetFundBalances({required this.repository});

  @override
  Future<Either<Failure, List<FundBalance>>> execute() async {
    final fundsEither = await repository.getFunds();

    return fundsEither.fold(
      (failure) => left(failure),
      (funds) {
        List<FundBalance> fundBalance = [];

        for (final fund in funds) {}

        return right(fundBalance);
      },
    );
  }
}
