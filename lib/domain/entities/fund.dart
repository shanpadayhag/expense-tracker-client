import 'package:equatable/equatable.dart';

class Fund extends Equatable {
  final int? id;
  final String name;

  const Fund({this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
