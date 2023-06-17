import 'package:expense_tracker_client/core/components/segment_control/segment_control_child.dart';
import 'package:get/get.dart';

class SegmentControlController extends GetxController {
  Map<String, SegmentControlChild> childrenToMap(
      List<SegmentControlChild> children, String? groupValue) {
    Map<String, SegmentControlChild> resultMap = {};

    for (final child in children) {
      resultMap[child.value] = child.copyWith(groupValue: groupValue);
    }

    return resultMap;
  }
}

extension SegmentControlChildExtensions on SegmentControlChild {
  SegmentControlChild copyWith({String? groupValue}) {
    return SegmentControlChild(
      value: value,
      label: label,
      groupValue: groupValue ?? this.groupValue,
    );
  }
}
