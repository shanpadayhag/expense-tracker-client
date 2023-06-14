import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:expense_tracker_client/core/configs/drift/tables/funds_table.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [Funds])
class DriftDB extends _$DriftDB {
  DriftDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path,
        'KEkLzVcmoIq6cwLJ7QRJtyPFaOJqOsLAiExWEdhYOIpwtNNCKnWGERfB74DXhREc.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
