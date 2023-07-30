import 'package:equatable/equatable.dart';

class FundBalance extends Equatable {
  final String name;
  final double balance;

  const FundBalance({
    required this.name,
    required this.balance,
  });

  @override
  List<Object?> get props => [name, balance];
}
