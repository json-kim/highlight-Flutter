import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/image_file/image_file_local_data_source.dart';
import 'package:highlight_flutter/domain/model/exception/photo_exception.dart';
import 'package:highlight_flutter/domain/repository/photo_repository.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:image_picker/image_picker.dart';

class PhotoLocalRepository implements PhotoRepository {
  const PhotoLocalRepository(
      {required this.photosDao,
      required this.highlightsDao,
      required this.imageDataSource});

  final PhotosDao photosDao;
  final HighlightsDao highlightsDao;
  final ImageFileLocalDataSource imageDataSource;

  @override
  Future<PhotoApiResult<List<PhotoThumbnailModel>>> retrievePhotos(
      {String? cursorHighlightId}) async {
    try {
      final highlightDate = cursorHighlightId == null
          ? DateTime.now()
          : await highlightsDao.selectHighlightDate(cursorHighlightId);

      final photos =
          await photosDao.selectPhotos(highlightDate ?? DateTime.now());

      return ApiSuccess(photos);
    } catch (e, s) {
      return ApiFail(PhotoException(
          message: PhotoException.retrieveRequestFail, trace: s));
    }
  }

  @override
  Future<PhotoApiResult<void>> savePhoto(
      PhotoModel photo, String highlightId) async {
    try {
      final path = await imageDataSource.saveImage(XFile(photo.path));
      await photosDao.insertPhoto(path, highlightId);

      return ApiSuccess(null);
    } catch (e, s) {
      return ApiFail(
          PhotoException(message: PhotoException.saveRequestFail, trace: s));
    }
  }
}
