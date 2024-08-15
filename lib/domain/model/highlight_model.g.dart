// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightModelImpl _$$HighlightModelImplFromJson(Map<String, dynamic> json) =>
    _$HighlightModelImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => const XFileConverter().fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$$HighlightModelImplToJson(
        _$HighlightModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
      'color': const ColorConverter().toJson(instance.color),
      'photos': instance.photos.map(const XFileConverter().toJson).toList(),
    };
