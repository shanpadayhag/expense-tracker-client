import 'package:expense_tracker_client/core/components/segment_control/segment_control_child.dart';
import 'package:expense_tracker_client/core/components/segment_control/segment_control_controller.dart';
import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SegmentControl extends StatefulWidget {
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
  _SegmentControlState createState() => _SegmentControlState();
}

class _SegmentControlState extends State<SegmentControl> {
  final controller =
      Get.put(SegmentControlController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorEnum.ultraMarineBlue.value,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: CupertinoSlidingSegmentedControl(
        children: controller.childrenToMap(widget.children, widget.value),
        onValueChanged: widget.onValueChanged ?? (value) {},
        groupValue: widget.value ?? '',
        backgroundColor: Colors.transparent,
        thumbColor: ColorEnum.ultraMarineBlue.value,
      ),
    );
  }
}
