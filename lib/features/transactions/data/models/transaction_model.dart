import 'package:expense_tracker_client/features/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    int? id,
    String? code,
    required String title,
  }) : super(
          id: id,
          code: code,
          title: title,
        );

  static TransactionModel fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      code: transaction.code,
      title: transaction.title,
    );
  }
}
