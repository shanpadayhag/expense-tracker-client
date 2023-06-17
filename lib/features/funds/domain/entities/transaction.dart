import 'package:equatable/equatable.dart';
import 'package:expense_tracker_client/core/enums/transaction_type_enum.dart';

class Transaction extends Equatable {
  final int? id;
  final int fundId;
  final String title;
  final TransactionType type;
  final double amount;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;

  const Transaction({
    this.id,
    required this.fundId,
    required this.title,
    required this.type,
    required this.amount,
    this.dateCreated,
    this.dateUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        fundId,
        title,
        type,
        amount,
        dateCreated,
        dateUpdated,
      ];
}
