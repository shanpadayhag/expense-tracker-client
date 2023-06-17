import 'package:expense_tracker_client/features/calculations/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<DashboardController>(builder: (_) {
            return Text(controller.test.toString());
          }),
          TextButton(
            onPressed: controller.updateTest,
            child: const Text('update'),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/wallet');
            },
            child: const Text('replace page'),
          ),
        ],
      ),
    );
  }
}
