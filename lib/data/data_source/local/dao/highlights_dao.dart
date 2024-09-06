import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/extensions/json1.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:highlight_flutter/data/data_source/local/table/highlights_table.dart';
import 'package:highlight_flutter/data/data_source/local/table/photos_table.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/highlight_repository.dart';

part 'highlights_dao.g.dart';

@DriftAccessor(tables: [HighlightsTable, PhotosTable])
class HighlightsDao extends DatabaseAccessor<AppDatabase>
    with _$HighlightsDaoMixin {
  HighlightsDao(super.attachedDatabase);

  Future<int> insertHighlight(HighlightInputData highlight) {
    return into(highlightsTable)
        .insert(_makeHighlightTableCompanion(highlight));
  }

  HighlightsTableCompanion _makeHighlightTableCompanion(
      HighlightInputData input) {
    return HighlightsTableCompanion.insert(
        title: input.title,
        content: input.content,
        color: input.color.value,
        date: input.date);
  }

  SimpleSelectStatement<$HighlightsTableTable, HighlightsTableData>
      _makeSelectHighlightWithRowId(int rowId) {
    return select<$HighlightsTableTable, HighlightsTableData>(highlightsTable)
      ..where((tbl) => tbl.rowId.equals(rowId));
  }

  Future<String?> selectHighlightId(int rowId) {
    return _makeSelectHighlightWithRowId(rowId)
        .map((row) => row.id)
        .getSingleOrNull();
  }

  Future<HighlightModel?> selectHighlightWithRowId(int rowId) {
    return _makeSelectHighlightWithRowId(rowId)
        .map(toHighlightModelWithTableData)
        .getSingleOrNull();
  }

  Future<DateTime?> selectHighlightDate(String highlightId) {
    final query = select(highlightsTable)
      ..where((tbl) => tbl.id.equals(highlightId));

    return query.map((row) => row.date).getSingleOrNull();
  }

  String _jsonObjectExpression(String tableName, List<String> columns) {
    return 'json_object(${columns.map((e) => '\'$e\', $tableName.$e').join(', ')})';
  }

  Expression<String> _makeCaseWhenExpression(
      {required Expression<bool> whenExpression,
      required Expression<String> thenExpression,
      Expression<String>? orElseExpression}) {
    return CaseWhenExpression(
        cases: [CaseWhen<bool, String>(whenExpression, then: thenExpression)],
        orElse: orElseExpression);
  }

  Expression<String> _makeJsonGroupArrayExpression(
      String tableName, List<String> columns) {
    return jsonGroupArray(
        CustomExpression<String>(_jsonObjectExpression(tableName, columns)));
  }

  Expression<String> _makeSelectHighlightsExpression() {
    return _makeCaseWhenExpression(
        whenExpression: photosTable.id.count().equals(0),
        thenExpression: const Constant('[]'),
        orElseExpression:
            _makeJsonGroupArrayExpression('photos_table', ['id', 'path']));
  }

  JoinedSelectStatement _makeHighlightsJoinPhotosBeforeQuery(
      DateTime cursorDate,
      int pageSize,
      List<Expression> jsonColumnExpressions) {
    return select(highlightsTable).join([
      leftOuterJoin(
          photosTable, photosTable.highlight.equalsExp(highlightsTable.id))
    ])
      ..where(highlightsTable.date.isSmallerThanValue(cursorDate))
      ..groupBy([highlightsTable.id])
      ..addColumns(jsonColumnExpressions)
      ..orderBy([
        OrderingTerm(expression: highlightsTable.date, mode: OrderingMode.desc)
      ])
      ..limit(pageSize);
  }

  Future<List<HighlightModel>> _selectHighlightsJoinPhotosBefore(
      DateTime cursorDate, int pageSize) {
    final selectHighlightsExpression = _makeSelectHighlightsExpression();

    return _makeHighlightsJoinPhotosBeforeQuery(
            cursorDate, pageSize, [selectHighlightsExpression])
        .map((row) => toHighlightModel(row, selectHighlightsExpression))
        .get();
  }

  Future<List<HighlightModel>> selectHighlights(DateTime before,
      {int pageSize = 20}) async {
    return _selectHighlightsJoinPhotosBefore(before, pageSize);
  }

  JoinedSelectStatement _makeHighlightJoinPhotosQuery(
      String highlightId, List<Expression> jsonColumnExpressions) {
    return select(highlightsTable).join([
      leftOuterJoin(
          photosTable, photosTable.highlight.equalsExp(highlightsTable.id))
    ])
      ..where(highlightsTable.id.equals(highlightId))
      ..groupBy([highlightsTable.id])
      ..addColumns(jsonColumnExpressions);
  }

  Future<HighlightModel?> _selectHighlightJoinPhotos(String highlightId) {
    final selectHighlightsExpression = _makeSelectHighlightsExpression();
    return _makeHighlightJoinPhotosQuery(
            highlightId, [selectHighlightsExpression])
        .map((row) => toHighlightModel(row, selectHighlightsExpression))
        .getSingleOrNull();
  }

  Future<HighlightModel?> selectHighlight(String highlightId) {
    return _selectHighlightJoinPhotos(highlightId);
  }

  Future<int> selectCountHighlights() async {
    return await (selectOnly(highlightsTable)
              ..addColumns([highlightsTable.id.count()]))
            .map((row) => row.read(highlightsTable.id.count()))
            .getSingle() ??
        0;
  }

  HighlightModel toHighlightModelWithTableData(HighlightsTableData data) {
    return HighlightModel.fromJson({
      'id': data.id,
      'title': data.title,
      'content': data.content,
      'date': data.date.toIso8601String(),
      'color': data.color,
    });
  }

  HighlightModel toHighlightModel(
      TypedResult row, Expression<String> photosExpression) {
    final highlightsTableData = row.readTable(highlightsTable);
    final photosJsonArrayString = row.read(photosExpression) ?? '';
    final highlightJson = {
      'id': highlightsTableData.id,
      'title': highlightsTableData.title,
      'content': highlightsTableData.content,
      'date': highlightsTableData.date.toIso8601String(),
      'color': highlightsTableData.color,
      'photos': (jsonDecode(photosJsonArrayString) as List)
          .map((e) => e['path'])
          .toList(),
    };

    return HighlightModel.fromJson(highlightJson);
  }

  DeleteStatement _makeDeleteQuery(String highlightId) {
    return delete<$HighlightsTableTable, HighlightsTableData>(highlightsTable)
      ..where((tbl) => tbl.id.equals(highlightId));
  }

  Future<int> deleteHighlight(String highlightId) {
    return _makeDeleteQuery(highlightId).go();
  }
}
