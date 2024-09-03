import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';

abstract interface class PhotoRepository {
  Future<void> savePhoto(PhotoModel photo, String highlightId);
  Future<List<PhotoThumbnailModel>> retrievePhotos({String? cursorHighlightId});
}
