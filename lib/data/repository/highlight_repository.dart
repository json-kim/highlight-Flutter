import 'package:highlight_flutter/domain/model/highlight_model.dart';

abstract interface class HighlightRepository {
  Future<void> saveHighlight(HighlightModel highlight);
  Future<int> countAllHighlight();
  Future<List<HighlightModel>> retrieveHighlights({String? cursorId});
  Future<HighlightModel?> retrieveHighlight(String highlightId);
}
