import 'package:expense_tracker_client/core/components/segment_control/segment_control_controller.dart';
import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:expense_tracker_client/core/utils/enum_utils.dart';
import 'package:expense_tracker_client/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:expense_tracker_client/features/funds/data/datasources/sqlite/fund_sqlite_source.dart';
import 'package:expense_tracker_client/features/funds/data/repositories/fund_repository_impl.dart';
import 'package:expense_tracker_client/features/funds/domain/usecases/add_fund.dart';
import 'package:expense_tracker_client/features/funds/domain/usecases/get_funds.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void init() {
  // Controllers
  Get.lazyPut<DashboardController>(
      () => DashboardController(enumUtil: Get.find<EnumUtil>()));
  Get.lazyPut<SegmentControlController>(() => SegmentControlController());

  // Use cases
  Get.create<AddFund>(() => AddFund(Get.find<FundRepositoryImpl>()),
      permanent: true);
  Get.create<GetFunds>(() => GetFunds(Get.find<FundRepositoryImpl>()),
      permanent: true);

  // Repositories
  Get.create<FundRepositoryImpl>(
      () => FundRepositoryImpl(sqliteSource: Get.find<FundSQLiteSourceImpl>()),
      permanent: true);

  // Datasources
  Get.create<FundSQLiteSourceImpl>(
      () => FundSQLiteSourceImpl(database: Get.find<DriftDB>()),
      permanent: true);

  // Configs
  Get.create<DriftDB>(() => DriftDB(), permanent: true);

  // Utils
  Get.create<EnumUtil>(() => EnumUtil(), permanent: true);
  Get.create<CurrencyUtil>(() => CurrencyUtil(), permanent: true);

  // External
  Get.create<http.Client>(() => http.Client(), permanent: true);
}
