import 'package:drift/drift.dart';
import 'package:highlight_flutter/const/uuid/uuid.dart';

class HighlightsTable extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();
  TextColumn get title => text()();
  TextColumn get content => text()();
  IntColumn get color => integer()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
