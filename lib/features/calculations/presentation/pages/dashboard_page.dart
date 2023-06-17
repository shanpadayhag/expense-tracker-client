import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/layouts/user_default_layout.dart';
import 'package:expense_tracker_client/core/utils/currency.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return UserDefaultLayout(
      appBarTitle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('Today: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              )),
          const SizedBox(width: 5),
          Text('${Currency.getSymbol(CurrencyNameEnum.php)} 1,234.56',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
