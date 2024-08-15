// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HighlightsTableTable extends HighlightsTable
    with TableInfo<$HighlightsTableTable, HighlightsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HighlightsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, color, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'highlights_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HighlightsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HighlightsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HighlightsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $HighlightsTableTable createAlias(String alias) {
    return $HighlightsTableTable(attachedDatabase, alias);
  }
}

class HighlightsTableData extends DataClass
    implements Insertable<HighlightsTableData> {
  final String id;
  final String title;
  final String content;
  final int color;
  final DateTime date;
  const HighlightsTableData(
      {required this.id,
      required this.title,
      required this.content,
      required this.color,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['color'] = Variable<int>(color);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  HighlightsTableCompanion toCompanion(bool nullToAbsent) {
    return HighlightsTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      color: Value(color),
      date: Value(date),
    );
  }

  factory HighlightsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HighlightsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      color: serializer.fromJson<int>(json['color']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'color': serializer.toJson<int>(color),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  HighlightsTableData copyWith(
          {String? id,
          String? title,
          String? content,
          int? color,
          DateTime? date}) =>
      HighlightsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        color: color ?? this.color,
        date: date ?? this.date,
      );
  HighlightsTableData copyWithCompanion(HighlightsTableCompanion data) {
    return HighlightsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      color: data.color.present ? data.color.value : this.color,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HighlightsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('color: $color, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, color, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HighlightsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.color == this.color &&
          other.date == this.date);
}

class HighlightsTableCompanion extends UpdateCompanion<HighlightsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int> color;
  final Value<DateTime> date;
  final Value<int> rowid;
  const HighlightsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.color = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HighlightsTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required int color,
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        content = Value(content),
        color = Value(color),
        date = Value(date);
  static Insertable<HighlightsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? color,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (color != null) 'color': color,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HighlightsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int>? color,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return HighlightsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      color: color ?? this.color,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HighlightsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('color: $color, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotosTableTable extends PhotosTable
    with TableInfo<$PhotosTableTable, PhotosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _highlightMeta =
      const VerificationMeta('highlight');
  @override
  late final GeneratedColumn<String> highlight = GeneratedColumn<String>(
      'highlight', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES highlights_table (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, path, highlight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos_table';
  @override
  VerificationContext validateIntegrity(Insertable<PhotosTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('highlight')) {
      context.handle(_highlightMeta,
          highlight.isAcceptableOrUnknown(data['highlight']!, _highlightMeta));
    } else if (isInserting) {
      context.missing(_highlightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotosTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      highlight: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}highlight'])!,
    );
  }

  @override
  $PhotosTableTable createAlias(String alias) {
    return $PhotosTableTable(attachedDatabase, alias);
  }
}

class PhotosTableData extends DataClass implements Insertable<PhotosTableData> {
  final String id;
  final String path;
  final String highlight;
  const PhotosTableData(
      {required this.id, required this.path, required this.highlight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['path'] = Variable<String>(path);
    map['highlight'] = Variable<String>(highlight);
    return map;
  }

  PhotosTableCompanion toCompanion(bool nullToAbsent) {
    return PhotosTableCompanion(
      id: Value(id),
      path: Value(path),
      highlight: Value(highlight),
    );
  }

  factory PhotosTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotosTableData(
      id: serializer.fromJson<String>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      highlight: serializer.fromJson<String>(json['highlight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'path': serializer.toJson<String>(path),
      'highlight': serializer.toJson<String>(highlight),
    };
  }

  PhotosTableData copyWith({String? id, String? path, String? highlight}) =>
      PhotosTableData(
        id: id ?? this.id,
        path: path ?? this.path,
        highlight: highlight ?? this.highlight,
      );
  PhotosTableData copyWithCompanion(PhotosTableCompanion data) {
    return PhotosTableData(
      id: data.id.present ? data.id.value : this.id,
      path: data.path.present ? data.path.value : this.path,
      highlight: data.highlight.present ? data.highlight.value : this.highlight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotosTableData(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('highlight: $highlight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, highlight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotosTableData &&
          other.id == this.id &&
          other.path == this.path &&
          other.highlight == this.highlight);
}

class PhotosTableCompanion extends UpdateCompanion<PhotosTableData> {
  final Value<String> id;
  final Value<String> path;
  final Value<String> highlight;
  final Value<int> rowid;
  const PhotosTableCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.highlight = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotosTableCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    required String highlight,
    this.rowid = const Value.absent(),
  })  : path = Value(path),
        highlight = Value(highlight);
  static Insertable<PhotosTableData> custom({
    Expression<String>? id,
    Expression<String>? path,
    Expression<String>? highlight,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (highlight != null) 'highlight': highlight,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotosTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? path,
      Value<String>? highlight,
      Value<int>? rowid}) {
    return PhotosTableCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      highlight: highlight ?? this.highlight,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (highlight.present) {
      map['highlight'] = Variable<String>(highlight.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosTableCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('highlight: $highlight, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HighlightsTableTable highlightsTable =
      $HighlightsTableTable(this);
  late final $PhotosTableTable photosTable = $PhotosTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [highlightsTable, photosTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('highlights_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('photos_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('highlights_table',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('photos_table', kind: UpdateKind.update),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$HighlightsTableTableCreateCompanionBuilder = HighlightsTableCompanion
    Function({
  Value<String> id,
  required String title,
  required String content,
  required int color,
  required DateTime date,
  Value<int> rowid,
});
typedef $$HighlightsTableTableUpdateCompanionBuilder = HighlightsTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> content,
  Value<int> color,
  Value<DateTime> date,
  Value<int> rowid,
});

class $$HighlightsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HighlightsTableTable,
    HighlightsTableData,
    $$HighlightsTableTableFilterComposer,
    $$HighlightsTableTableOrderingComposer,
    $$HighlightsTableTableCreateCompanionBuilder,
    $$HighlightsTableTableUpdateCompanionBuilder> {
  $$HighlightsTableTableTableManager(
      _$AppDatabase db, $HighlightsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HighlightsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HighlightsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HighlightsTableCompanion(
            id: id,
            title: title,
            content: content,
            color: color,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String title,
            required String content,
            required int color,
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              HighlightsTableCompanion.insert(
            id: id,
            title: title,
            content: content,
            color: color,
            date: date,
            rowid: rowid,
          ),
        ));
}

class $$HighlightsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HighlightsTableTable> {
  $$HighlightsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter photosTableRefs(
      ComposableFilter Function($$PhotosTableTableFilterComposer f) f) {
    final $$PhotosTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.photosTable,
        getReferencedColumn: (t) => t.highlight,
        builder: (joinBuilder, parentComposers) =>
            $$PhotosTableTableFilterComposer(ComposerState($state.db,
                $state.db.photosTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$HighlightsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HighlightsTableTable> {
  $$HighlightsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PhotosTableTableCreateCompanionBuilder = PhotosTableCompanion
    Function({
  Value<String> id,
  required String path,
  required String highlight,
  Value<int> rowid,
});
typedef $$PhotosTableTableUpdateCompanionBuilder = PhotosTableCompanion
    Function({
  Value<String> id,
  Value<String> path,
  Value<String> highlight,
  Value<int> rowid,
});

class $$PhotosTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PhotosTableTable,
    PhotosTableData,
    $$PhotosTableTableFilterComposer,
    $$PhotosTableTableOrderingComposer,
    $$PhotosTableTableCreateCompanionBuilder,
    $$PhotosTableTableUpdateCompanionBuilder> {
  $$PhotosTableTableTableManager(_$AppDatabase db, $PhotosTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PhotosTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PhotosTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> highlight = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PhotosTableCompanion(
            id: id,
            path: path,
            highlight: highlight,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String path,
            required String highlight,
            Value<int> rowid = const Value.absent(),
          }) =>
              PhotosTableCompanion.insert(
            id: id,
            path: path,
            highlight: highlight,
            rowid: rowid,
          ),
        ));
}

class $$PhotosTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PhotosTableTable> {
  $$PhotosTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$HighlightsTableTableFilterComposer get highlight {
    final $$HighlightsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.highlight,
            referencedTable: $state.db.highlightsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$HighlightsTableTableFilterComposer(ComposerState($state.db,
                    $state.db.highlightsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PhotosTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PhotosTableTable> {
  $$PhotosTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$HighlightsTableTableOrderingComposer get highlight {
    final $$HighlightsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.highlight,
            referencedTable: $state.db.highlightsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$HighlightsTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.highlightsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HighlightsTableTableTableManager get highlightsTable =>
      $$HighlightsTableTableTableManager(_db, _db.highlightsTable);
  $$PhotosTableTableTableManager get photosTable =>
      $$PhotosTableTableTableManager(_db, _db.photosTable);
}
