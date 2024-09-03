import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/repository/photo_repository.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';

class PhotoLocalRepository implements PhotoRepository {
  const PhotoLocalRepository(
      {required this.photosDao, required this.highlightsDao});

  final PhotosDao photosDao;
  final HighlightsDao highlightsDao;

  @override
  Future<List<PhotoThumbnailModel>> retrievePhotos(
      {String? cursorHighlightId}) async {
    final highlightDate = cursorHighlightId == null
        ? DateTime.now()
        : await highlightsDao.selectHighlightDate(cursorHighlightId);

    final photos =
        await photosDao.selectPhotos(highlightDate ?? DateTime.now());

    return photos;
  }

  @override
  Future<void> savePhoto(PhotoModel photo, String highlightId) {
    return photosDao.insertPhoto(photo.path, highlightId);
  }
}
