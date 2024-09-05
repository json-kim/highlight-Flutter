import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/image_file/image_file_local_data_source.dart';
import 'package:highlight_flutter/domain/model/exception/highlight_exception.dart';
import 'package:highlight_flutter/domain/repository/highlight_repository.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
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
  Future<HighlightApiResult<int>> countAllHighlight() async {
    try {
      return ApiResult.success(await highlightsDao.selectCountHighlights());
    } catch (e, s) {
      return ApiResult.fail(HighlightException(
          message: HighlightException.retrieveRequestFail, trace: s));
    }
  }

  @override
  Future<HighlightApiResult<List<HighlightModel>>> retrieveHighlights(
      {String? cursorId}) async {
    try {
      final highlightDate = cursorId == null
          ? DateTime.now()
          : await highlightsDao.selectHighlightDate(cursorId);

      final highlights =
          await highlightsDao.selectHighlights(highlightDate ?? DateTime.now());
      return ApiSuccess(highlights);
    } catch (e, s) {
      return ApiFail(HighlightException(
          message: HighlightException.retrieveRequestFail, trace: s));
    }
  }

  @override
  Future<HighlightApiResult<HighlightModel>> retrieveHighlight(
      String highlightId) async {
    try {
      final result = await highlightsDao.selectHighlight(highlightId);

      if (result == null) {
        return ApiFail(
            HighlightException(message: HighlightException.notExist));
      }

      return ApiSuccess(result);
    } catch (e, s) {
      return ApiFail(HighlightException(
          message: HighlightException.retrieveRequestFail, trace: s));
    }
  }

  @override
  Future<HighlightApiResult<void>> saveHighlight(
      HighlightModel highlight) async {
    try {
      final rowId = await highlightsDao.insertHighlight(highlight);

      final highlightId = await highlightsDao.selectHighlightId(rowId);

      if (highlightId == null) return ApiResult.success(null);
      final newPaths = await _saveMultiImage(highlight.photos);
      await photosDao.insertMultiplePhotos(newPaths, highlightId);

      return ApiResult.success(null);
    } catch (e, t) {
      return ApiResult.fail(HighlightException(
          message: HighlightException.saveRequestFail, trace: t));
    }
  }

  Future<List<String>> _saveMultiImage(List<XFile> photos) async {
    return await Future.wait(photos.map((e) => imageDataSource.saveImage(e)));
  }

  @override
  Future<HighlightApiResult<void>> deleteHighlight(String highlightId) async {
    try {
      await highlightsDao.deleteHighlight(highlightId);

      return HighlightApiResult.success(null);
    } catch (e, s) {
      return HighlightApiResult.fail(HighlightException(
          message: HighlightException.saveRequestFail, trace: s));
    }
  }
}
