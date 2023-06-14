import 'package:expense_tracker_client/presentation/pages/user/dashboard/user_dashboard_page.dart';
import 'package:get/get.dart';

class UserRoute {
  static String dashboard = "/";

  static String getDashboardRoute = dashboard;

  static List<GetPage> routes = [
    GetPage(name: dashboard, page: () => const UserDashboardPage()),
  ];
}
