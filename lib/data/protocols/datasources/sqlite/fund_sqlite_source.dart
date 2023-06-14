import 'package:expense_tracker_client/data/models/fund_model.dart';

abstract class FundSQLiteSource {
  Future<List<FundModel>> getFunds();
  Future<FundModel> addFund(FundModel fund);
}
