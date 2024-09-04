import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:highlight_flutter/const/uuid/uuid.dart';
import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/table/highlights_table.dart';
import 'package:highlight_flutter/data/data_source/local/table/photos_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [HighlightsTable, PhotosTable], daos: [HighlightsDao, PhotosDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? connection})
      : super(connection ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }
}
