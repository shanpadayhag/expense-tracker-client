import 'package:expense_tracker_client/core/configs/drift/platform_impl/stub_connection.dart'
    if (dart.library.io) 'package:expense_tracker_client/core/configs/drift/platform_impl/native_connection.dart'
    if (dart.library.html) 'package:expense_tracker_client/core/configs/drift/platform_impl/web_connection.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker_client/core/configs/drift/tables/funds_table.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [Funds])
class DriftDB extends _$DriftDB {
  DriftDB() : super(Connection().openConnection());

  @override
  int get schemaVersion => 1;
}
