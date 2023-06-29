import 'package:expense_tracker_client/features/funds/data/models/fund_model.dart';
import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';

abstract class FundSQLiteSource {
  Future<List<Fund>> getFunds();
  Future<Fund> addFund(FundModel fund);
  Future<Fund> upsertFund(FundModel fund);
}
