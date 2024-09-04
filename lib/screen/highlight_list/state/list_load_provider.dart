import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_list/state/highlight_list_provider.dart';

final listLoadProvider =
    NotifierProvider.autoDispose<ListLoadProvider, ListLoadState>(
        () => ListLoadProvider(),
        name: '[Provider]ListLoad');

class ListLoadProvider extends AutoDisposeNotifier<ListLoadState> {
  @override
  ListLoadState build() {
    return LoadReady();
  }

  Future<void> initLoad() async {
    if (!validateRequest(state)) {
      return;
    }

    state = LoadingList();
    final isEndPage = await _refreshRequest();

    state = isEndPage ? NoMoreList() : LoadReady();
  }

  Future<void> listLoad() async {
    if (!validateRequest(state)) {
      return;
    }

    state = LoadingList();
    final isEndPage = await _loadRequest();

    state = isEndPage ? NoMoreList() : LoadReady();
  }

  bool validateRequest(ListLoadState state) {
    if (state is LoadReady) return true;
    return false;
  }

  Future<bool> _loadRequest() async {
    return ref.watch(highlightListProvider.notifier).loadNextPage();
  }

  Future<bool> _refreshRequest() async {
    return ref.watch(highlightListProvider.notifier).refreshPage();
  }
}

sealed class ListLoadState {}

class LoadingList extends ListLoadState {}

class LoadReady extends ListLoadState {}

class NoMoreList extends ListLoadState {}
