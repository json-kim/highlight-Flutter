import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';

final highlightCountProvider =
    AsyncNotifierProvider.autoDispose<HighlightCountProvider, int>(
        () => HighlightCountProvider(),
        name: '[Provider]HighlightCount');

class HighlightCountProvider extends AutoDisposeAsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    return _requestCount();
  }

  Future<void> loadCount() async {
    state = AsyncValue.data(await _requestCount());
  }

  Future<int> _requestCount() async {
    final result =
        await ref.watch(highlightRepositoryProvider).countAllHighlight();

    return switch (result) {
      ApiSuccess() => result.data,
      ApiFail() => 0,
    };
  }
}
