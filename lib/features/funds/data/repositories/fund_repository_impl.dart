import 'package:dartz/dartz.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/core/protocols/failures/failure.dart';
import 'package:expense_tracker_client/core/protocols/failures/sqlite_failure.dart';
import 'package:expense_tracker_client/features/funds/data/models/fund_model.dart';
import 'package:expense_tracker_client/features/funds/data/protocols/datasources/sqlite/fund_sqlite_source.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';
import 'package:expense_tracker_client/features/funds/domain/repositories/fund_repository.dart';

class FundRepositoryImpl implements FundRepository {
  final FundSQLiteSource sqliteSource;

  FundRepositoryImpl({required this.sqliteSource});

  @override
  Future<Either<Failure, List<Fund>>> getFunds() async {
    try {
      return Right(await sqliteSource.getFunds());
    } on SQLiteException {
      return Left(SQLiteFailure());
    }
  }

  @override
  Future<Either<Failure, Fund>> addFund(Fund params) async {
    try {
      return Right(await sqliteSource.addFund(FundModel(name: params.name)));
    } on SQLiteException {
      return Left(SQLiteFailure());
    }
  }

  @override
  Future<Either<Failure, Fund>> deleteFund() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Fund>> updateFund() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Fund>> upsertFund(Fund fund) async {
    try {
      return Right(await sqliteSource
          .upsertFund(FundModel(name: fund.name, id: fund.id)));
    } on SQLiteException {
      return Left(SQLiteFailure());
    }
  }
}
