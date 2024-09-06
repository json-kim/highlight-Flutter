import 'dart:ui';

import 'package:highlight_flutter/domain/model/exception/highlight_exception.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:image_picker/image_picker.dart';

typedef HighlightApiResult<T> = ApiResult<T, HighlightException>;
typedef HighlightInputData = ({
  String title,
  String content,
  DateTime date,
  Color color,
  List<XFile> photos
});

abstract interface class HighlightRepository {
  Future<HighlightApiResult<HighlightModel>> saveHighlight(
      HighlightInputData highlightInput);
  Future<HighlightApiResult<int>> countAllHighlight();
  Future<HighlightApiResult<List<HighlightModel>>> retrieveHighlights(
      {String? cursorId});
  Future<HighlightApiResult<HighlightModel>> retrieveHighlight(
      String highlightId);
  Future<HighlightApiResult<void>> deleteHighlight(String highlightId);
}
