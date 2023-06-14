import 'package:expense_tracker_client/presentation/pages/guest/login/login_page.dart';
import 'package:get/get.dart';

class GuestRoute {
  static String login = "/login";

  static String getLoginRoute = login;

  static List<GetPage> routes = [
    GetPage(name: login, page: () => const LoginPage()),
  ];
}
