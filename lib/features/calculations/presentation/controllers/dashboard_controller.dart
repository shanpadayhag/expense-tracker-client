import 'package:get/get.dart';

class DashboardController extends GetxController {
  var test = 0;

  void updateTest() {
    test++;
    update();
    print(test);
  }
}
