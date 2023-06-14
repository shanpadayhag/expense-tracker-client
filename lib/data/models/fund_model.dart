import 'package:expense_tracker_client/domain/entities/fund.dart';

class FundModel extends Fund {
  const FundModel({int? id, required String name}) : super(id: id, name: name);

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
