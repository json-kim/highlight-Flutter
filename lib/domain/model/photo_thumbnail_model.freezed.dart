// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_thumbnail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoThumbnailModel {
  String get highlightId => throw _privateConstructorUsedError;
  PhotoModel get thumbnailPhoto => throw _privateConstructorUsedError;
  int get photoCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoThumbnailModelCopyWith<PhotoThumbnailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoThumbnailModelCopyWith<$Res> {
  factory $PhotoThumbnailModelCopyWith(
          PhotoThumbnailModel value, $Res Function(PhotoThumbnailModel) then) =
      _$PhotoThumbnailModelCopyWithImpl<$Res, PhotoThumbnailModel>;
  @useResult
  $Res call({String highlightId, PhotoModel thumbnailPhoto, int photoCount});

  $PhotoModelCopyWith<$Res> get thumbnailPhoto;
}

/// @nodoc
class _$PhotoThumbnailModelCopyWithImpl<$Res, $Val extends PhotoThumbnailModel>
    implements $PhotoThumbnailModelCopyWith<$Res> {
  _$PhotoThumbnailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlightId = null,
    Object? thumbnailPhoto = null,
    Object? photoCount = null,
  }) {
    return _then(_value.copyWith(
      highlightId: null == highlightId
          ? _value.highlightId
          : highlightId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailPhoto: null == thumbnailPhoto
          ? _value.thumbnailPhoto
          : thumbnailPhoto // ignore: cast_nullable_to_non_nullable
              as PhotoModel,
      photoCount: null == photoCount
          ? _value.photoCount
          : photoCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoModelCopyWith<$Res> get thumbnailPhoto {
    return $PhotoModelCopyWith<$Res>(_value.thumbnailPhoto, (value) {
      return _then(_value.copyWith(thumbnailPhoto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoThumbnailModelImplCopyWith<$Res>
    implements $PhotoThumbnailModelCopyWith<$Res> {
  factory _$$PhotoThumbnailModelImplCopyWith(_$PhotoThumbnailModelImpl value,
          $Res Function(_$PhotoThumbnailModelImpl) then) =
      __$$PhotoThumbnailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String highlightId, PhotoModel thumbnailPhoto, int photoCount});

  @override
  $PhotoModelCopyWith<$Res> get thumbnailPhoto;
}

/// @nodoc
class __$$PhotoThumbnailModelImplCopyWithImpl<$Res>
    extends _$PhotoThumbnailModelCopyWithImpl<$Res, _$PhotoThumbnailModelImpl>
    implements _$$PhotoThumbnailModelImplCopyWith<$Res> {
  __$$PhotoThumbnailModelImplCopyWithImpl(_$PhotoThumbnailModelImpl _value,
      $Res Function(_$PhotoThumbnailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlightId = null,
    Object? thumbnailPhoto = null,
    Object? photoCount = null,
  }) {
    return _then(_$PhotoThumbnailModelImpl(
      highlightId: null == highlightId
          ? _value.highlightId
          : highlightId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailPhoto: null == thumbnailPhoto
          ? _value.thumbnailPhoto
          : thumbnailPhoto // ignore: cast_nullable_to_non_nullable
              as PhotoModel,
      photoCount: null == photoCount
          ? _value.photoCount
          : photoCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PhotoThumbnailModelImpl implements _PhotoThumbnailModel {
  const _$PhotoThumbnailModelImpl(
      {required this.highlightId,
      required this.thumbnailPhoto,
      required this.photoCount});

  @override
  final String highlightId;
  @override
  final PhotoModel thumbnailPhoto;
  @override
  final int photoCount;

  @override
  String toString() {
    return 'PhotoThumbnailModel(highlightId: $highlightId, thumbnailPhoto: $thumbnailPhoto, photoCount: $photoCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoThumbnailModelImpl &&
            (identical(other.highlightId, highlightId) ||
                other.highlightId == highlightId) &&
            (identical(other.thumbnailPhoto, thumbnailPhoto) ||
                other.thumbnailPhoto == thumbnailPhoto) &&
            (identical(other.photoCount, photoCount) ||
                other.photoCount == photoCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, highlightId, thumbnailPhoto, photoCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoThumbnailModelImplCopyWith<_$PhotoThumbnailModelImpl> get copyWith =>
      __$$PhotoThumbnailModelImplCopyWithImpl<_$PhotoThumbnailModelImpl>(
          this, _$identity);
}

abstract class _PhotoThumbnailModel implements PhotoThumbnailModel {
  const factory _PhotoThumbnailModel(
      {required final String highlightId,
      required final PhotoModel thumbnailPhoto,
      required final int photoCount}) = _$PhotoThumbnailModelImpl;

  @override
  String get highlightId;
  @override
  PhotoModel get thumbnailPhoto;
  @override
  int get photoCount;
  @override
  @JsonKey(ignore: true)
  _$$PhotoThumbnailModelImplCopyWith<_$PhotoThumbnailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoModel {
  String get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call({String id, String path});
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoModelImplCopyWith<$Res>
    implements $PhotoModelCopyWith<$Res> {
  factory _$$PhotoModelImplCopyWith(
          _$PhotoModelImpl value, $Res Function(_$PhotoModelImpl) then) =
      __$$PhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String path});
}

/// @nodoc
class __$$PhotoModelImplCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$PhotoModelImpl>
    implements _$$PhotoModelImplCopyWith<$Res> {
  __$$PhotoModelImplCopyWithImpl(
      _$PhotoModelImpl _value, $Res Function(_$PhotoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
  }) {
    return _then(_$PhotoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhotoModelImpl implements _PhotoModel {
  const _$PhotoModelImpl({required this.id, required this.path});

  @override
  final String id;
  @override
  final String path;

  @override
  String toString() {
    return 'PhotoModel(id: $id, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      __$$PhotoModelImplCopyWithImpl<_$PhotoModelImpl>(this, _$identity);
}

abstract class _PhotoModel implements PhotoModel {
  const factory _PhotoModel(
      {required final String id,
      required final String path}) = _$PhotoModelImpl;

  @override
  String get id;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
