import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/domain/repository/repository_provider.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/domain/repository/result/api_result.dart';
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

typedef InputData = ({
  String title,
  String content,
  DateTime date,
  Color color,
  List<XFile> photos
});

class HighlightSave extends AutoDisposeNotifier<SaveState> {
  HighlightSave();

  @override
  SaveState build() {
    return SaveNotReady.titleRequired();
  }

  Future<void> saveHighlight() async {
    final currentData = readCurrentData();
    final readyOrNotReady =
        checkValidate(currentData.title, currentData.content);

    if (readyOrNotReady is SaveNotReady) {
      state = readyOrNotReady;
      return;
    }

    final request = SaveRequest.fromInputData(currentData);
    state = request;
    state = await requestSaveHighlight(request);
    return;
  }

  InputData readCurrentData() {
    return (
      title: ref.watch(currentTitleProvider.notifier).state,
      content: ref.watch(currentContentProvider.notifier).state,
      date: ref.watch(selectedDateProvider.notifier).state,
      color: ref.watch(selectedColorProvider.notifier).state,
      photos: ref.watch(currentPickedPhotosProvider.notifier).state
    );
  }

  SaveState? checkValidate(String title, String content) {
    if (title.isEmpty) return SaveNotReady.titleRequired();
    if (content.isEmpty) return SaveNotReady.contentRequired();
    return SaveReady();
  }

  Future<SaveState> requestSaveHighlight(SaveRequest request) async {
    final result = await ref
        .watch(highlightRepositoryProvider)
        .saveHighlight(request.toModel());

    return switch (result) {
      ApiSuccess() => SaveSuccess(),
      ApiFail() => SaveFail(failReason: result.exception.message.toString())
    };
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

class SaveReady extends SaveState {}

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

  factory SaveRequest.fromInputData(InputData data) => SaveRequest(
      title: data.title,
      content: data.content,
      date: data.date,
      color: data.color,
      photos: data.photos);

  HighlightModel toModel() => HighlightModel(
      id: 'tempId', title: title, content: content, date: date, color: color);
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
