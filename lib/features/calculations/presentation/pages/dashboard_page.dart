import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/enums/financial_type_enum.dart';
import 'package:expense_tracker_client/core/layouts/user_default_layout.dart';
import 'package:expense_tracker_client/core/utils/currency.dart';
import 'package:flutter/cupertino.dart';
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
          const Text(
            'Today: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(width: 2),
          Text('${Currency.getSymbol(CurrencyNameEnum.php)}1,234.56',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorEnum.ultraMarineBlue.value,
                        style: BorderStyle.solid,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: CupertinoSlidingSegmentedControl(
                    children: {
                      FinancialTypeEnum.expense.name: Text(
                        FinancialTypeEnum.expense.label,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      FinancialTypeEnum.income.name: Text(
                        FinancialTypeEnum.income.label,
                        style:
                            TextStyle(color: ColorEnum.ultraMarineBlue.value),
                      ),
                    },
                    onValueChanged: (value) {},
                    groupValue: FinancialTypeEnum.expense.name,
                    backgroundColor: Colors.transparent,
                    thumbColor: ColorEnum.ultraMarineBlue.value,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
