import 'package:highlight_flutter/domain/model/exception/photo_exception.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';

typedef PhotoApiResult<T> = ApiResult<T, PhotoException>;

abstract interface class PhotoRepository {
  Future<PhotoApiResult<void>> savePhoto(PhotoModel photo, String highlightId);
  Future<PhotoApiResult<List<PhotoThumbnailModel>>> retrievePhotos(
      {String? cursorHighlightId});
}
