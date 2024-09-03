import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/image_file/image_file_local_data_source.dart';
import 'package:highlight_flutter/data/repository/highlight_repository.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:image_picker/image_picker.dart';

class HighlightLocalRepository implements HighlightRepository {
  const HighlightLocalRepository(
      {required this.highlightsDao,
      required this.photosDao,
      required this.imageDataSource});

  final HighlightsDao highlightsDao;
  final PhotosDao photosDao;
  final ImageFileLocalDataSource imageDataSource;

  @override
  Future<int> countAllHighlight() {
    return highlightsDao.selectCountHighlights();
  }

  @override
  Future<List<HighlightModel>> retrieveHighlights({String? cursorId}) async {
    final highlightDate = cursorId == null
        ? DateTime.now()
        : await highlightsDao.selectHighlightDate(cursorId);

    final highlights =
        await highlightsDao.selectHighlights(highlightDate ?? DateTime.now());
    return highlights;
  }

  @override
  Future<HighlightModel?> retrieveHighlight(String highlightId) {
    return highlightsDao.selectHighlight(highlightId);
  }

  @override
  Future<void> saveHighlight(HighlightModel highlight) async {
    final rowId = await highlightsDao.insertHighlight(highlight);

    final highlightId = await highlightsDao.selectHighlightId(rowId);

    if (highlightId == null) return;
    await _saveMultiImage(highlight.photos);
    await photosDao.insertMultiplePhotos(
        highlight.photos.map((e) => e.path).toList(), highlightId);
  }

  Future<void> _saveMultiImage(List<XFile> photos) async {
    await Future.wait(photos.map((e) => imageDataSource.saveImage(e)));
  }
}
