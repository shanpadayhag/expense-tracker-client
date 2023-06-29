import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int? id;
  final String? code;
  final String title;

  const Transaction({
    this.id,
    this.code,
    required this.title,
  });

  @override
  List<Object?> get props => [id, code, title];
}
