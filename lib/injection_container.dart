import 'package:expense_tracker_client/core/components/segment_control/segment_control_controller.dart';
import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:expense_tracker_client/core/utils/date_utils.dart';
import 'package:expense_tracker_client/core/utils/enum_utils.dart';
import 'package:expense_tracker_client/core/utils/generation_utils.dart';
import 'package:expense_tracker_client/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:expense_tracker_client/features/funds/data/datasources/sqlite/fund_sqlite_source_impl.dart';
import 'package:expense_tracker_client/features/funds/data/repositories/fund_repository_impl.dart';
import 'package:expense_tracker_client/features/funds/domain/usecases/add_fund.dart';
import 'package:expense_tracker_client/features/funds/domain/usecases/get_funds.dart';
import 'package:expense_tracker_client/features/payment_histories/data/datasources/sqlite/payment_sqlite_source_impl.dart';
import 'package:expense_tracker_client/features/payment_histories/data/repositories/payment_repository_impl.dart';
import 'package:expense_tracker_client/features/transactions/data/datasources/sqlite/transaction_sqlite_source_impl.dart';
import 'package:expense_tracker_client/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:expense_tracker_client/features/transactions/domain/usecases/create_transaction.dart';
import 'package:expense_tracker_client/features/transactions/presentation/controllers/wallet_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void init() {
  // Controllers
  Get.lazyPut<DashboardController>(
      () => DashboardController(enumUtil: Get.find<EnumUtil>()));
  Get.lazyPut<SegmentControlController>(() => SegmentControlController());
  Get.lazyPut<WalletController>(
      () => WalletController(createTransaction: Get.find<CreateTransaction>()));

  // Use cases
  Get.create<AddFund>(() => AddFund(Get.find<FundRepositoryImpl>()),
      permanent: true);
  Get.create<GetFunds>(() => GetFunds(Get.find<FundRepositoryImpl>()),
      permanent: true);
  Get.create<CreateTransaction>(
      () => CreateTransaction(
          fundRepository: Get.find<FundRepositoryImpl>(),
          generationUtils: Get.find<GenerationUtils>(),
          paymentRepository: Get.find<PaymentRepositoryImpl>(),
          transactionRepository: Get.find<TransactionRepositoryImpl>()),
      permanent: true);

  // Repositories
  Get.create<FundRepositoryImpl>(
      () => FundRepositoryImpl(sqliteSource: Get.find<FundSQLiteSourceImpl>()),
      permanent: true);
  Get.create<PaymentRepositoryImpl>(
      () => PaymentRepositoryImpl(
          sqliteSource: Get.find<PaymentSQLiteSourceImpl>()),
      permanent: true);
  Get.create<TransactionRepositoryImpl>(
      () => TransactionRepositoryImpl(
          sqliteSource: Get.find<TransactionSQLiteSourceImpl>()),
      permanent: true);

  // Datasources
  Get.create<FundSQLiteSourceImpl>(
      () => FundSQLiteSourceImpl(database: Get.find<DriftDB>()),
      permanent: true);
  Get.create<TransactionSQLiteSourceImpl>(
      () => TransactionSQLiteSourceImpl(database: Get.find<DriftDB>()),
      permanent: true);
  Get.create<PaymentSQLiteSourceImpl>(
      () => PaymentSQLiteSourceImpl(database: Get.find<DriftDB>()),
      permanent: true);

  // Configs
  Get.put<DriftDB>(DriftDB(), permanent: true);

  // Utils
  Get.create<EnumUtil>(() => EnumUtil(), permanent: true);
  Get.create<CurrencyUtil>(() => CurrencyUtil(), permanent: true);
  Get.create<DateUtils>(() => DateUtils(), permanent: true);
  Get.create<GenerationUtils>(
      () => GenerationUtils(dateUtils: Get.find<DateUtils>()),
      permanent: true);

  // External
  Get.create<http.Client>(() => http.Client(), permanent: true);
}
