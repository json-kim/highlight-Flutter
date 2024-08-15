import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:highlight_flutter/domain/model/color_converter.dart';
import 'package:highlight_flutter/domain/model/xfile_converter.dart';
import 'package:image_picker/image_picker.dart';

part 'highlight_model.freezed.dart';
part 'highlight_model.g.dart';

@freezed
class HighlightModel with _$HighlightModel {
  const factory HighlightModel({
    required String title,
    required String content,
    required DateTime date,
    @ColorConverter() required Color color,
    @XFileConverter() required List<XFile> photos,
  }) = _HighlightModel;

  factory HighlightModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightModelFromJson(json);
}
