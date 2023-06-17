import 'package:expense_tracker_client/features/calculations/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
            onPressed: () {
              Get.offAndToNamed('/');
            },
            child: const Text('replace page'),
          ),
        ],
      ),
    );
  }
}
