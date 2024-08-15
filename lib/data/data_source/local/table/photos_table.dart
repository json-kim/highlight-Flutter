import 'package:drift/drift.dart';
import 'package:highlight_flutter/const/uuid/uuid.dart';
import 'package:highlight_flutter/data/data_source/local/table/highlights_table.dart';

class PhotosTable extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();
  TextColumn get path => text()();
  TextColumn get highlight => text().references(HighlightsTable, #id,
      onDelete: KeyAction.cascade, onUpdate: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
