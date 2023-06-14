import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/data/models/fund_model.dart';
import 'package:expense_tracker_client/data/protocols/datasources/sqlite/fund_sqlite_source.dart';

class FundSQLiteSourceImpl implements FundSQLiteSource {
  final DriftDB database;

  FundSQLiteSourceImpl({required this.database});

  @override
  Future<List<FundModel>> getFunds() async {
    final fundList = await database.select(database.funds).get();
    final List<FundModel> funds = [];

    for (final fund in fundList) {
      funds.add(FundModel.fromJson({'id': fund.id, 'name': fund.name}));
    }

    return funds;
  }

  @override
  Future<FundModel> addFund(FundModel fund) async {
    final id = await database
        .into(database.funds)
        .insert(FundsCompanion.insert(name: fund.name));

    return FundModel(name: fund.name, id: id);
  }
}
