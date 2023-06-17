import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/material.dart';

class SegmentControlChild extends StatefulWidget {
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
  _SegmentControlChildState createState() => _SegmentControlChildState();
}

class _SegmentControlChildState extends State<SegmentControlChild> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: TextStyle(
        color: widget.value == widget.groupValue
            ? Colors.white
            : ColorEnum.ultraMarineBlue.value,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
