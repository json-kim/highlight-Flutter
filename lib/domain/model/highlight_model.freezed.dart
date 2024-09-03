// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HighlightModel _$HighlightModelFromJson(Map<String, dynamic> json) {
  return _HighlightModel.fromJson(json);
}

/// @nodoc
mixin _$HighlightModel {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  @XFileConverter()
  List<XFile> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HighlightModelCopyWith<HighlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightModelCopyWith<$Res> {
  factory $HighlightModelCopyWith(
          HighlightModel value, $Res Function(HighlightModel) then) =
      _$HighlightModelCopyWithImpl<$Res, HighlightModel>;
  @useResult
  $Res call(
      {String title,
      String content,
      DateTime date,
      @ColorConverter() Color color,
      @XFileConverter() List<XFile> photos});
}

/// @nodoc
class _$HighlightModelCopyWithImpl<$Res, $Val extends HighlightModel>
    implements $HighlightModelCopyWith<$Res> {
  _$HighlightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? date = null,
    Object? color = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighlightModelImplCopyWith<$Res>
    implements $HighlightModelCopyWith<$Res> {
  factory _$$HighlightModelImplCopyWith(_$HighlightModelImpl value,
          $Res Function(_$HighlightModelImpl) then) =
      __$$HighlightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      DateTime date,
      @ColorConverter() Color color,
      @XFileConverter() List<XFile> photos});
}

/// @nodoc
class __$$HighlightModelImplCopyWithImpl<$Res>
    extends _$HighlightModelCopyWithImpl<$Res, _$HighlightModelImpl>
    implements _$$HighlightModelImplCopyWith<$Res> {
  __$$HighlightModelImplCopyWithImpl(
      _$HighlightModelImpl _value, $Res Function(_$HighlightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? date = null,
    Object? color = null,
    Object? photos = null,
  }) {
    return _then(_$HighlightModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighlightModelImpl implements _HighlightModel {
  const _$HighlightModelImpl(
      {required this.title,
      required this.content,
      required this.date,
      @ColorConverter() required this.color,
      @XFileConverter() final List<XFile> photos = const []})
      : _photos = photos;

  factory _$HighlightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightModelImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime date;
  @override
  @ColorConverter()
  final Color color;
  final List<XFile> _photos;
  @override
  @JsonKey()
  @XFileConverter()
  List<XFile> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'HighlightModel(title: $title, content: $content, date: $date, color: $color, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, date, color,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightModelImplCopyWith<_$HighlightModelImpl> get copyWith =>
      __$$HighlightModelImplCopyWithImpl<_$HighlightModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HighlightModelImplToJson(
      this,
    );
  }
}

abstract class _HighlightModel implements HighlightModel {
  const factory _HighlightModel(
      {required final String title,
      required final String content,
      required final DateTime date,
      @ColorConverter() required final Color color,
      @XFileConverter() final List<XFile> photos}) = _$HighlightModelImpl;

  factory _HighlightModel.fromJson(Map<String, dynamic> json) =
      _$HighlightModelImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get date;
  @override
  @ColorConverter()
  Color get color;
  @override
  @XFileConverter()
  List<XFile> get photos;
  @override
  @JsonKey(ignore: true)
  _$$HighlightModelImplCopyWith<_$HighlightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
