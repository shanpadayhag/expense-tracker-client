import 'package:expense_tracker_client/features/calculations/presentation/pages/wallet_page.dart';
import 'package:get/get.dart';
import 'package:expense_tracker_client/features/dashboard/presentation/pages/dashboard_page.dart';

class UserRoute {
  static String dashboard = "/";
  static String wallet = "/wallet";

  static List<GetPage> routes = [
    GetPage(name: dashboard, page: () => const DashboardPage()),
    GetPage(name: wallet, page: () => const WalletPage()),
  ];
}
