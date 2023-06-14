import 'package:drift/drift.dart';

abstract class BaseConnection {
  QueryExecutor openConnection();
}
