import 'dart:ui';

import 'package:test/test.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:image_picker/image_picker.dart';

HighlightModel makeTestHighlightModel(
    {String title = '태국 여행',
    String content = '칼국수 맛있어',
    DateTime? date,
    Color color = Colors.red,
    List<XFile>? photos}) {
  return HighlightModel(
      title: title,
      content: content,
      date: date ?? DateTime.now(),
      color: color,
      photos: photos ?? [XFile('test1.png,'), XFile('test2.png,')]);
}

HighlightsTableCompanion makeTestHighlightCompanion(
    {String? id,
    String title = '태국 여행',
    String content = '칼국수 맛있어',
    DateTime? date,
    Color color = Colors.red,
    List<XFile>? photos}) {
  return HighlightsTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      title: title,
      content: content,
      color: color.value,
      date: date ?? DateTime.now());
}

void expectHighlightModels(HighlightModel model1, HighlightModel model2,
    {bool checkWithoutPhotos = true}) {
  expect(model1.title, model2.title);
  expect(model1.content, model2.content);
  expect(model1.color.value, model2.color.value);
  expect(model1.date, model2.date);

  if (checkWithoutPhotos) return;
  expect(model1.photos.length, model2.photos.length);
  for (int i = 0; i < model1.photos.length; i++) {
    expect(model1.photos[i].path, model2.photos[i].path);
  }
}
