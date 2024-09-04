import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/model/photo_thumbnail_model.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
import 'package:highlight_flutter/util/list/list_utils.dart';

final photoThumbnailListProvider =
    NotifierProvider.autoDispose<PhotoThumbnailList, List<PhotoThumbnailModel>>(
        () => PhotoThumbnailList(),
        name: '[Provider]PhotoThumbnailList');

class PhotoThumbnailList
    extends AutoDisposeNotifier<List<PhotoThumbnailModel>> {
  @override
  List<PhotoThumbnailModel> build() {
    return [];
  }

  Future<bool> loadNextPage() async {
    final result = await _loadPhotoThumbnails(readCursor(state));
    state = addElementsLast(state, result.list);
    return result.isEnd;
  }

  Future<bool> refreshPage() async {
    final result = await _loadPhotoThumbnails(null);
    state = result.list;
    return result.isEnd;
  }

  String? readCursor(List<PhotoThumbnailModel> photoThumbnails) {
    return photoThumbnails.lastOrNull?.highlightId;
  }

  Future<({List<PhotoThumbnailModel> list, bool isEnd})> _loadPhotoThumbnails(
      String? cursorId) async {
    final result = await ref
        .watch(photoRepositoryProvider)
        .retrievePhotos(cursorHighlightId: cursorId);

    return switch (result) {
      ApiSuccess() => (list: result.data, isEnd: checkEndPage(result.data)),
      ApiFail() => (list: <PhotoThumbnailModel>[], isEnd: false),
    };
  }

  bool checkEndPage(List<PhotoThumbnailModel> list) {
    return list.isEmpty;
  }
}
