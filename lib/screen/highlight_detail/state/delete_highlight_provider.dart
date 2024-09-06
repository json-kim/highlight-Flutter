import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:highlight_flutter/screen/highlight_detail/state/detail_highlight_id_provider.dart';

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
    state = await _deleteRequest(_readHighlightId());
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
}

sealed class DeleteState {}

class DeleteReady extends DeleteState {}

class Deleteing extends DeleteState {}

class DeleteDone extends DeleteState {}

class DeleteFail extends DeleteState {
  DeleteFail({required this.failReason});

  final String failReason;
}
