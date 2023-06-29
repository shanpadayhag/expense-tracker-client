import 'package:expense_tracker_client/features/funds/domain/entities/fund.dart';

class FundModel extends Fund {
  const FundModel({int? id, required String name}) : super(id: id, name: name);

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static FundModel fromEntity(Fund fund) {
    return FundModel(id: fund.id, name: fund.name);
  }
}
