import 'package:drift/drift.dart' as drift;
import 'package:expense_tracker_client/core/configs/drift/platform_impl/base_connection.dart';

class Connection implements BaseConnection {
  @override
  drift.QueryExecutor openConnection() {
    throw Exception("Stub implementation");
  }
}
