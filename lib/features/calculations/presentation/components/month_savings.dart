import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:expense_tracker_client/core/enums/currency_name_enum.dart';
import 'package:expense_tracker_client/core/utils/currency_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MonthSavings extends StatelessWidget {
  final currencyUtil = Get.find<CurrencyUtil>();
  final double savingsAmount;

  MonthSavings({
    Key? key,
    required this.savingsAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
          )
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 15,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'March Savings',
                style: TextStyle(
                  color: ColorEnum.starDust.value,
                ),
              ),
              Text(
                currencyUtil.amountToCurrencyFormat(
                    savingsAmount, CurrencyNameEnum.php),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              LinearPercentIndicator(
                lineHeight: 30,
                barRadius: const Radius.circular(15),
                percent: 0.60,
                progressColor: ColorEnum.pictonBlue.value,
                backgroundColor: ColorEnum.desertStorm.value,
                padding: const EdgeInsets.all(0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Earned',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      currencyUtil.amountToCurrencyFormat(
                          10500, CurrencyNameEnum.php),
                      style: TextStyle(color: ColorEnum.paleSky.value),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              LinearPercentIndicator(
                lineHeight: 30,
                barRadius: const Radius.circular(15),
                percent: 0.35,
                progressColor: ColorEnum.brinkPink.value,
                backgroundColor: ColorEnum.desertStorm.value,
                padding: const EdgeInsets.all(0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Spend',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      currencyUtil.amountToCurrencyFormat(
                          10500, CurrencyNameEnum.php),
                      style: TextStyle(color: ColorEnum.paleSky.value),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
