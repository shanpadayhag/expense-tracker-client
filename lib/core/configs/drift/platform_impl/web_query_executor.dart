import 'package:drift/drift.dart' as drift;
import 'package:drift/web.dart';
import 'package:expense_tracker_client/core/configs/drift/platform_impl/base_query_executor.dart';

class Connection implements BaseConnection {
  @override
  drift.QueryExecutor openConnection() {
    return WebDatabase('db');
  }
}
