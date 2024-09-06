import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:highlight_flutter/screen/highlight_detail/state/detail_highlight_id_provider.dart';
import 'package:highlight_flutter/screen/highlight_list/state/highlight_list_provider.dart';
import 'package:highlight_flutter/screen/photo_grid/state/photo_thumbnail_list_provider.dart';
import 'package:highlight_flutter/screen/profile/state/highlight_count_provider.dart';

final deleteHighlightProvider =
    NotifierProvider.autoDispose<DeleteHighlight, DeleteState>(
        () => DeleteHighlight(),
        name: '[Provider]DeleteHighlight',
        dependencies: [detailHighlightIdProvider]);

class DeleteHighlight extends AutoDisposeNotifier<DeleteState> {
  @override
  DeleteState build() {
    return DeleteReady();
  }

  Future<void> deleteHighlight() async {
    if (!_isValidateDelete(state)) return;

    state = Deleteing();
    final highlightId = _readHighlightId();
    state = await _deleteRequest(highlightId);
    _applyDeletedChange(highlightId);
  }

  bool _isValidateDelete(DeleteState state) {
    if (state is DeleteReady) return true;
    return false;
  }

  String _readHighlightId() {
    return ref.watch(detailHighlightIdProvider);
  }

  Future<DeleteState> _deleteRequest(String highlightId) async {
    final result = await ref
        .watch(highlightRepositoryProvider)
        .deleteHighlight(highlightId);

    return switch (result) {
      ApiSuccess() => DeleteDone(),
      ApiFail() => DeleteFail(failReason: result.exception.message.toString()),
    };
  }

  void _applyDeletedChange(String highlightId) {
    if (ref.exists(highlightListProvider)) {
      _changeHighlightListData(highlightId);
    }

    if (ref.exists(photoThumbnailListProvider)) {
      _changePhotoListData(highlightId);
    }

    if (ref.exists(highlightCountProvider)) {
      _changeHighlightCountData();
    }
  }

  void _changeHighlightListData(String highlightId) {
    ref.watch(highlightListProvider.notifier).removeHighlight(highlightId);
  }

  void _changePhotoListData(String highlightId) {
    ref
        .watch(photoThumbnailListProvider.notifier)
        .removePhotoThumbnail(highlightId);
  }

  void _changeHighlightCountData() {
    ref.watch(highlightCountProvider.notifier).loadCount();
  }
}

sealed class DeleteState {}

class DeleteReady extends DeleteState {}

class Deleteing extends DeleteState {}

class DeleteDone extends DeleteState {}

class DeleteFail extends DeleteState {
  DeleteFail({required this.failReason});

  final String failReason;
}
