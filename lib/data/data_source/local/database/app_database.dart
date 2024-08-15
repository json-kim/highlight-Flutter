import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:highlight_flutter/const/uuid/uuid.dart';
import 'package:highlight_flutter/data/data_source/local/table/highlights_table.dart';
import 'package:highlight_flutter/data/data_source/local/table/photos_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [HighlightsTable, PhotosTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static DatabaseConnection _openConnection() {
    return driftDatabase(name: 'app_database') as DatabaseConnection;
  }
}
