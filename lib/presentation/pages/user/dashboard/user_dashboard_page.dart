import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/data/datasources/sqlite/fund_sqlite_source.dart';
import 'package:expense_tracker_client/data/repositories/funds/fund_repository_impl.dart';
import 'package:expense_tracker_client/domain/usecases/funds/get_funds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _UserDashboardPage();
}

class _UserDashboardPage extends State<UserDashboardPage> {
  late FundSQLiteSourceImpl fundSQLiteSource;
  late FundRepositoryImpl fundRepository;
  late GetFunds getFundsUseCase;

  @override
  void initState() {
    super.initState();
    fundSQLiteSource = FundSQLiteSourceImpl(database: Get.find<DriftDB>());
    fundRepository = FundRepositoryImpl(sqliteSource: fundSQLiteSource);
    getFundsUseCase = GetFunds(fundRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
