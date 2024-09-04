import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:highlight_flutter/util/list/list_utils.dart';

final highlightListProvider =
    NotifierProvider.autoDispose<HighlightListProvider, List<HighlightModel>>(
        () => HighlightListProvider(),
        name: '[Provider]HighlightList');

class HighlightListProvider extends AutoDisposeNotifier<List<HighlightModel>> {
  @override
  List<HighlightModel> build() {
    return [];
  }

  Future<bool> loadNextPage() async {
    final nextPageResult = await _loadHighlights(nextCursor(state));
    state = addElementsLast(state, nextPageResult.list);
    return nextPageResult.isEnd;
  }

  String? nextCursor(List<HighlightModel> model) {
    return model.lastOrNull?.id;
  }

  Future<({List<HighlightModel> list, bool isEnd})> _loadHighlights(
      String? cursorHighlightId) async {
    final result = await ref
        .watch(highlightRepositoryProvider)
        .retrieveHighlights(cursorId: cursorHighlightId);

    return switch (result) {
      ApiSuccess() => (list: result.data, isEnd: checkEndPage(result.data)),
      ApiFail() => (list: <HighlightModel>[], isEnd: false),
    };
  }

  bool checkEndPage(List<HighlightModel> list) {
    return list.isEmpty;
  }
}
