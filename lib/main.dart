import 'package:expense_tracker_client/core/routes/routes.dart';
import 'package:expense_tracker_client/core/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'injection_container.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyClass().init();
  runApp(GetMaterialApp(
    theme: lightTheme,
    initialRoute: Routes.initialRoute,
    getPages: Routes.routes,
  ));
}
