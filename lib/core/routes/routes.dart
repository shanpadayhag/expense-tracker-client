import 'package:expense_tracker_client/core/routes/guest_route.dart';
import 'package:expense_tracker_client/core/routes/user_route.dart';
import 'package:get/get.dart';

class Routes {
  static String initialRoute = UserRoute.dashboard;

  static List<GetPage> routes = [...GuestRoute.routes, ...UserRoute.routes];
}
