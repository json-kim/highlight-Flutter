import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:highlight_flutter/screen/highlight_detail/state/detail_highlight_id_provider.dart';

final detailHighlightProvider =
    AsyncNotifierProvider.autoDispose<DetailHighlightProvider, HighlightModel>(
        () => DetailHighlightProvider(),
        name: '[Provider]DetailHighlight',
        dependencies: [detailHighlightIdProvider]);

class DetailHighlightProvider extends AutoDisposeAsyncNotifier<HighlightModel> {
  @override
  FutureOr<HighlightModel> build() {
    return loadHighlight();
  }

  String readHighlightId() {
    return ref.watch(detailHighlightIdProvider);
  }

  Future<HighlightModel> loadHighlight() {
    return _requestHighlight(readHighlightId());
  }

  Future<HighlightModel> _requestHighlight(String highlightId) async {
    final result = await ref
        .watch(highlightRepositoryProvider)
        .retrieveHighlight(highlightId);

    return switch (result) {
      ApiSuccess() => result.data,
      ApiFail() => throw result.exception,
    };
  }
}
