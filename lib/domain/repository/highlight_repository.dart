import 'package:highlight_flutter/domain/model/exception/highlight_exception.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';

typedef HighlightApiResult<T> = ApiResult<T, HighlightException>;

abstract interface class HighlightRepository {
  Future<HighlightApiResult<void>> saveHighlight(HighlightModel highlight);
  Future<HighlightApiResult<int>> countAllHighlight();
  Future<HighlightApiResult<List<HighlightModel>>> retrieveHighlights(
      {String? cursorId});
  Future<HighlightApiResult<HighlightModel>> retrieveHighlight(
      String highlightId);
  Future<HighlightApiResult<void>> deleteHighlight(String highlightId);
}
