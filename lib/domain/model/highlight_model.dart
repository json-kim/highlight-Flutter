import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlight_flutter/domain/model/color_converter.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';
import 'package:highlight_flutter/domain/model/xfile_converter.dart';
import 'package:image_picker/image_picker.dart';

part 'highlight_model.freezed.dart';
part 'highlight_model.g.dart';

@freezed
class HighlightModel with _$HighlightModel {
  const HighlightModel._();

  const factory HighlightModel({
    required String id,
    required String title,
    required String content,
    required DateTime date,
    @ColorConverter() required Color color,
    @XFileConverter() @Default([]) List<XFile> photos,
  }) = _HighlightModel;

  factory HighlightModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightModelFromJson(json);

  PhotoThumbnailModel? extractPhotoThumbnail() {
    final thumbnailXFile = photos.firstOrNull;

    return thumbnailXFile == null
        ? null
        : PhotoThumbnailModel(
            highlightId: id,
            thumbnailPhoto:
                PhotoModel(id: 'tempPath', path: thumbnailXFile.path),
            photoCount: photos.length);
  }
}
