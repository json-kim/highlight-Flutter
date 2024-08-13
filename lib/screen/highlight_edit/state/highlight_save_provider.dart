import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_content_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_picked_photos_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/current_title_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/selected_color_provider.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/selected_date_provider.dart';
import 'package:image_picker/image_picker.dart';

final highlightSaveProvider =
    NotifierProvider.autoDispose<HighlightSave, SaveState>(
  () => HighlightSave(),
  name: '[Provider]HighlightSave',
);

class HighlightSave extends AutoDisposeNotifier<SaveState> {
  @override
  SaveState build() {
    return SaveNotReady.titleRequired();
  }

  Future<void> saveHighlight() async {
    final request = _makeRequest();

    if (request is SaveNotReady) {
      state = request;
      return;
    }

    // TODO: 저장 요청
    state = SaveSuccess();
    // state = SaveFail(failReason: '저장에 실패했습니다');
    return;
  }

  SaveState _makeRequest() {
    final date = ref.watch(selectedDateProvider.notifier).state;
    final color = ref.watch(selectedColorProvider.notifier).state;
    final title = ref.watch(currentTitleProvider.notifier).state;
    final content = ref.watch(currentContentProvider.notifier).state;
    final photos = ref.watch(currentPickedPhotosProvider.notifier).state;

    if (title.isEmpty) return SaveNotReady.titleRequired();
    if (content.isEmpty) return SaveNotReady.contentRequired();

    return SaveRequest(
        date: date,
        color: color,
        title: title,
        content: content,
        photos: photos);
  }
}

sealed class SaveState {}

class SaveNotReady extends SaveState {
  SaveNotReady({required this.reason});

  factory SaveNotReady.titleRequired() => SaveNotReady(reason: '제목을 작성해주세요');

  factory SaveNotReady.contentRequired() => SaveNotReady(reason: '내용을 작성해주세요');

  final String reason;

  @override
  String toString() {
    return reason;
  }
}

class SaveRequest extends SaveState {
  SaveRequest(
      {required this.date,
      required this.color,
      required this.title,
      required this.content,
      required this.photos});

  final DateTime date;
  final Color color;
  final String title;
  final String content;
  final List<XFile> photos;
}

class SaveSuccess extends SaveState {}

class SaveFail extends SaveState {
  SaveFail({required this.failReason});

  final String failReason;

  @override
  String toString() {
    return failReason;
  }
}
