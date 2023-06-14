import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:expense_tracker_client/core/configs/drift/platform_impl/base_connection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Connection implements BaseConnection {
  @override
  drift.QueryExecutor openConnection() {
    return drift.LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path,
          'KEkLzVcmoIq6cwLJ7QRJtyPFaOJqOsLAiExWEdhYOIpwtNNCKnWGERfB74DXhREc.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
