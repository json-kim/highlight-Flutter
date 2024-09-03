import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  late AppDatabase database;

  setUpAll(() {
    database = AppDatabase(connection: NativeDatabase.memory());
  });

  test('insertPhoto test', () async {
    final photoDao = PhotosDao(database);

    final testHighlightId = '123';
    final testPath = 'test.png';

    final rowId = await photoDao.insertPhoto(testPath, testHighlightId);

    final savedResult = await (photoDao.select(photoDao.photosTable)
          ..where((tbl) => tbl.rowId.equals(rowId)))
        .getSingleOrNull();

    expect(savedResult?.highlight, testHighlightId);
    expect(savedResult?.path, testPath);
  });

  test('insert multiple photos test', () async {
    final photoDao = PhotosDao(database);

    final testHighlightId = '123';
    final testPaths = ['test1.png', 'test2.png', 'test3.png'];

    await photoDao.insertMultiplePhotos(testPaths, testHighlightId);

    final savedResluts = await (photoDao.select(photoDao.photosTable)
          ..where((tbl) => tbl.highlight.equals(testHighlightId)))
        .get();

    expect(savedResluts[0].path, testPaths[0]);
    expect(savedResluts[1].path, testPaths[1]);
    expect(savedResluts[2].path, testPaths[2]);
  });

  test('select photos test', () async {
    final photoDao = PhotosDao(database);

    final testHighlightId1 = '123';
    final testPaths1 = ['test1.png', 'test2.png', 'test3.png'];
    final testHighlights1 = makeTestHighlightCompanion(
        id: testHighlightId1, photos: testPaths1.map((e) => XFile(e)).toList());
    final testHighlightId2 = '456';
    final testPaths2 = ['test4.png', 'test5.png'];
    final testHighlights2 = makeTestHighlightCompanion(
        id: testHighlightId2, photos: testPaths2.map((e) => XFile(e)).toList());
    await photoDao.into(photoDao.highlightsTable).insert(testHighlights1);
    await photoDao.into(photoDao.highlightsTable).insert(testHighlights2);
    await photoDao.insertMultiplePhotos(testPaths1, testHighlightId1);
    await photoDao.insertMultiplePhotos(testPaths2, testHighlightId2);

    final savedResults = await photoDao.selectPhotos(DateTime.now());

    expect(savedResults[0].highlightId, testHighlightId2);
    expect(savedResults[0].photoCount, testPaths2.length);
    expect(savedResults[1].highlightId, testHighlightId1);
    expect(savedResults[1].photoCount, testPaths1.length);
  });

  tearDownAll(() {
    database.close();
  });
}
