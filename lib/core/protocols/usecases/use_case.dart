import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> execute();
}
