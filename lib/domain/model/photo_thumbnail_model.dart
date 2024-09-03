import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_thumbnail_model.freezed.dart';

@freezed
class PhotoThumbnailModel with _$PhotoThumbnailModel {
  const factory PhotoThumbnailModel({
    required String highlightId,
    required PhotoModel thumbnailPhoto,
    required int photoCount,
  }) = _PhotoThumbnailModel;
}

@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({required String id, required String path}) =
      _PhotoModel;
}
