import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:highlight_flutter/data/data_source/local/table/photos_table.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';

part 'photos_dao.g.dart';

@DriftAccessor(tables: [PhotosTable])
class PhotosDao extends DatabaseAccessor<AppDatabase> with _$PhotosDaoMixin {
  PhotosDao(super.attachedDatabase);

  @visibleForTesting
  Future<PhotosTableData?> selectRecentPhoto() {
    final query = select(photosTable);
    return query.getSingleOrNull();
  }

  @visibleForTesting
  Future<void> insertTestData(
      HighlightsTableCompanion highlight, PhotosTableCompanion photo) async {
    await into(highlightsTable).insert(highlight);
    await into(photosTable).insert(photo);
  }

  PhotosTableCompanion _makePhotosTableCompanion(
      String path, String highlightId) {
    return PhotosTableCompanion.insert(path: path, highlight: highlightId);
  }

  Future<int> insertPhoto(String path, String highlightId) {
    return into(photosTable)
        .insert(_makePhotosTableCompanion(path, highlightId));
  }

  Future<void> insertMultiplePhotos(List<String> paths, String highlightId) {
    return batch((batch) => batch.insertAll(photosTable,
        paths.map((e) => _makePhotosTableCompanion(e, highlightId))));
  }

  PhotoThumbnailModel toPhotoThumbnailModel(TypedResult row) {
    final photoCount = row.read(photosTable.id.count());
    final highlightId = row.read(highlightsTable.id);
    final photoId = row.read(photosTable.id);
    final photoPath = row.read(photosTable.path);
    final thumbnailPhoto = PhotoModel(id: photoId ?? '', path: photoPath ?? '');
    final photoThumbnail = PhotoThumbnailModel(
        highlightId: highlightId ?? '',
        thumbnailPhoto: thumbnailPhoto,
        photoCount: photoCount ?? 0);

    return photoThumbnail;
  }

  JoinedSelectStatement _makeHighlightsJoinPhotosBefore(
      DateTime before, int pageSize) {
    return select(highlightsTable).join([
      leftOuterJoin(
          photosTable, photosTable.highlight.equalsExp(highlightsTable.id))
    ])
      ..where(highlightsTable.date.isSmallerThanValue(before))
      ..addColumns([photosTable.id.count()])
      ..orderBy([
        OrderingTerm(expression: highlightsTable.date, mode: OrderingMode.desc)
      ])
      ..groupBy([photosTable.highlight])
      ..limit(pageSize);
  }

  Future<List<PhotoThumbnailModel>> _selectHighlightsJoinPhotosBefore(
      DateTime before, int pageSize) {
    return _makeHighlightsJoinPhotosBefore(before, pageSize)
        .map(toPhotoThumbnailModel)
        .get();
  }

  Future<List<PhotoThumbnailModel>> selectPhotos(DateTime before,
      {int pageSize = 20}) async {
    return _selectHighlightsJoinPhotosBefore(before, pageSize);
  }
}
