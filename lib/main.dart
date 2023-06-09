import 'package:expense_tracker_client/core/configs/drift/drift.dart';
import 'package:expense_tracker_client/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DriftDB());
  runApp(GetMaterialApp(
    initialRoute: Routes.initialRoute,
    getPages: Routes.routes,
  ));
}
