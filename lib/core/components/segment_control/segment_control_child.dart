import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/material.dart';

class SegmentControlChild extends StatelessWidget {
  final String value;
  final String label;
  final String? groupValue;
  const SegmentControlChild({
    Key? key,
    required this.value,
    required this.label,
    this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: value == groupValue
              ? Colors.white
              : ColorEnum.ultraMarineBlue.value,
          fontWeight: FontWeight.normal),
    );
  }
}
