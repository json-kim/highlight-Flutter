import 'package:drift/native.dart';
import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  late AppDatabase database;

  setUpAll(() {
    database = AppDatabase(connection: NativeDatabase.memory());
  });
  test('insert Highlight / select Highlight with rowId', () async {
    final highlightsDao = HighlightsDao(database);
    final inputHighlightModel = makeTestHighlightModel();
    final input = (
      title: inputHighlightModel.title,
      content: inputHighlightModel.content,
      date: inputHighlightModel.date,
      color: inputHighlightModel.color,
      photos: inputHighlightModel.photos,
    );

    final rowId = await highlightsDao.insertHighlight(input);
    final resultHighlightModel =
        await highlightsDao.selectHighlightWithRowId(rowId);

    expect(resultHighlightModel?.title, inputHighlightModel.title);
    expect(resultHighlightModel?.content, inputHighlightModel.content);
    expect(resultHighlightModel?.color.value, inputHighlightModel.color.value);
    expect(resultHighlightModel?.date, inputHighlightModel.date);
  });

  test('select Highlight Date', () async {
    final highlightsDao = HighlightsDao(database);
    final highlightId = 'testId';
    final highlightDate = DateTime.now();
    final inputHighlightCompanion =
        makeTestHighlightCompanion(id: highlightId, date: highlightDate);

    await highlightsDao
        .into(highlightsDao.highlightsTable)
        .insert(inputHighlightCompanion);

    final resultDate = await highlightsDao.selectHighlightDate(highlightId);

    expect(resultDate, highlightDate);
  });

  test('select Highlits', () async {
    final highlightsDao = HighlightsDao(database);
    final highlightTestModel1 = makeTestHighlightModel(title: '테스트 1');
    final highlightTestModel2 = makeTestHighlightModel(title: '테스트 2');

    await Future.wait([
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel1)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel2)),
    ]);

    final highlights = await highlightsDao.selectHighlights(DateTime.now());

    expectHighlightModels(highlightTestModel1, highlights.first);
    expectHighlightModels(highlightTestModel2, highlights.last);
  });

  test('select Highlits after cursor', () async {
    final highlightsDao = HighlightsDao(database);
    final highlightTestModel1 =
        makeTestHighlightModel(title: '테스트 1', date: DateTime(2022, 9, 1));
    final highlightTestModel2 =
        makeTestHighlightModel(title: '테스트 2', date: DateTime(2022, 9, 2));
    final highlightTestModel3 =
        makeTestHighlightModel(title: '테스트 3', date: DateTime(2022, 9, 3));
    final highlightTestModel4 =
        makeTestHighlightModel(title: '테스트 4', date: DateTime(2022, 9, 4));
    final highlightTestModel5 =
        makeTestHighlightModel(title: '테스트 5', date: DateTime(2022, 9, 5));
    final highlightTestModel6 =
        makeTestHighlightModel(title: '테스트 6', date: DateTime(2022, 9, 6));

    await Future.wait([
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel1)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel2)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel3)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel4)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel5)),
      highlightsDao.insertHighlight(convertToInputData(highlightTestModel6)),
    ]);

    final highlights =
        await highlightsDao.selectHighlights(DateTime(2022, 9, 5));

    expect(highlights.length, 4);

    expectHighlightModels(highlightTestModel4, highlights[0]);
    expectHighlightModels(highlightTestModel3, highlights[1]);
    expectHighlightModels(highlightTestModel2, highlights[2]);
    expectHighlightModels(highlightTestModel1, highlights[3]);
  });

  test('select Highlight', () async {
    final highlightsDao = HighlightsDao(database);
    final highlightId = 'testId';
    final inputHighlightCompanion = makeTestHighlightCompanion(id: highlightId);

    await highlightsDao
        .into(highlightsDao.highlightsTable)
        .insert(inputHighlightCompanion);

    final resultHighlight = await highlightsDao.selectHighlight(highlightId);

    expect(resultHighlight?.title, inputHighlightCompanion.title.value);
    expect(resultHighlight?.content, inputHighlightCompanion.content.value);
    expect(resultHighlight?.date, inputHighlightCompanion.date.value);
    expect(resultHighlight?.color.value, inputHighlightCompanion.color.value);
  });

  test('select Highlights count', () async {
    final highlightsDao = HighlightsDao(database);

    final testCount = 10;
    final highlights = List.generate(
        testCount, (index) => makeTestHighlightModel(title: '제목$index'));

    await Future.wait(highlights
        .map((e) => highlightsDao.insertHighlight(convertToInputData(e))));

    final savedCount = await highlightsDao.selectCountHighlights();

    expect(savedCount, testCount);
  });

  test('delete Highlight', () async {
    final highlightsDao = HighlightsDao(database);

    final testId = 'testId';
    await highlightsDao
        .into(highlightsDao.highlightsTable)
        .insert(makeTestHighlightCompanion(id: testId));

    final savedResult =
        await (highlightsDao.select(highlightsDao.highlightsTable)
              ..where((tbl) => tbl.id.equals(testId)))
            .getSingleOrNull();

    expect(savedResult?.id, testId);

    await highlightsDao.deleteHighlight(testId);

    final savedResultAfterDelete =
        await (highlightsDao.select(highlightsDao.highlightsTable)
              ..where((tbl) => tbl.id.equals(testId)))
            .getSingleOrNull();
    expect(savedResultAfterDelete, null);
  });

  tearDownAll(() {
    database.close();
  });
}
