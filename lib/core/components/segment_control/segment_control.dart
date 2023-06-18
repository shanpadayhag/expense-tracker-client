import 'package:expense_tracker_client/core/components/segment_control/segment_control_child.dart';
import 'package:expense_tracker_client/core/components/segment_control/segment_control_controller.dart';
import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SegmentControl extends StatelessWidget {
  final List<SegmentControlChild> children;
  final String? value;
  final void Function(String? value)? onValueChanged;

  const SegmentControl({
    Key? key,
    required this.children,
    this.onValueChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SegmentControlController>();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorEnum.ultraMarineBlue.value,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: CupertinoSlidingSegmentedControl(
          children: controller.childrenToMap(children, value),
          onValueChanged: onValueChanged ?? (value) {},
          groupValue: value ?? '',
          backgroundColor: Colors.transparent,
          thumbColor: ColorEnum.ultraMarineBlue.value),
    );
  }
}
