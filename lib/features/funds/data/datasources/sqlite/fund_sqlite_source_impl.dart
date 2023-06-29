import 'package:drift/drift.dart';
import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/exceptions/server_exception.dart';
import 'package:expense_tracker_client/core/exceptions/sqlite_exception.dart';
import 'package:expense_tracker_client/features/funds/data/models/fund_model.dart';
import 'package:expense_tracker_client/features/funds/data/protocols/datasources/sqlite/fund_sqlite_source.dart';

class FundSQLiteSourceImpl implements FundSQLiteSource {
  final DriftDB database;

  FundSQLiteSourceImpl({required this.database});

  @override
  Future<List<FundModel>> getFunds() async {
    try {
      final fundList = await database.select(database.funds).get();
      final List<FundModel> funds = [];

      for (final fund in fundList) {
        funds.add(FundModel.fromJson({'id': fund.id, 'name': fund.name}));
      }

      return funds;
    } on Exception {
      throw SQLiteException();
    }
  }

  @override
  Future<FundModel> addFund(FundModel fund) async {
    try {
      final id = await database
          .into(database.funds)
          .insert(FundsCompanion.insert(name: fund.name));

      return FundModel(name: fund.name, id: id);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<FundModel> upsertFund(FundModel fund) async {
    try {
      final fundCompanion = FundsCompanion.insert(name: fund.name);
      final id = await database.into(database.funds).insert(
            fundCompanion,
            onConflict: DoUpdate(
              (fund) => fundCompanion,
              target: [database.funds.name],
            ),
          );

      return FundModel(name: fund.name, id: id);
    } on Exception {
      throw SQLiteException();
    }
  }
}
