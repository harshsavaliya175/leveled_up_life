// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookChapterModel _$BookChapterModelFromJson(Map<String, dynamic> json) {
  return _BookChapterModel.fromJson(json);
}

/// @nodoc
mixin _$BookChapterModel {
  @JsonKey(name: 'data')
  List<ChapterModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookChapterModelCopyWith<BookChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookChapterModelCopyWith<$Res> {
  factory $BookChapterModelCopyWith(
          BookChapterModel value, $Res Function(BookChapterModel) then) =
      _$BookChapterModelCopyWithImpl<$Res, BookChapterModel>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<ChapterModel>? data});
}

/// @nodoc
class _$BookChapterModelCopyWithImpl<$Res, $Val extends BookChapterModel>
    implements $BookChapterModelCopyWith<$Res> {
  _$BookChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChapterModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookChapterModelImplCopyWith<$Res>
    implements $BookChapterModelCopyWith<$Res> {
  factory _$$BookChapterModelImplCopyWith(_$BookChapterModelImpl value,
          $Res Function(_$BookChapterModelImpl) then) =
      __$$BookChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<ChapterModel>? data});
}

/// @nodoc
class __$$BookChapterModelImplCopyWithImpl<$Res>
    extends _$BookChapterModelCopyWithImpl<$Res, _$BookChapterModelImpl>
    implements _$$BookChapterModelImplCopyWith<$Res> {
  __$$BookChapterModelImplCopyWithImpl(_$BookChapterModelImpl _value,
      $Res Function(_$BookChapterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BookChapterModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChapterModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookChapterModelImpl implements _BookChapterModel {
  const _$BookChapterModelImpl(
      {@JsonKey(name: 'data') final List<ChapterModel>? data})
      : _data = data;

  factory _$BookChapterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookChapterModelImplFromJson(json);

  final List<ChapterModel>? _data;
  @override
  @JsonKey(name: 'data')
  List<ChapterModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookChapterModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookChapterModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookChapterModelImplCopyWith<_$BookChapterModelImpl> get copyWith =>
      __$$BookChapterModelImplCopyWithImpl<_$BookChapterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookChapterModelImplToJson(
      this,
    );
  }
}

abstract class _BookChapterModel implements BookChapterModel {
  const factory _BookChapterModel(
          {@JsonKey(name: 'data') final List<ChapterModel>? data}) =
      _$BookChapterModelImpl;

  factory _BookChapterModel.fromJson(Map<String, dynamic> json) =
      _$BookChapterModelImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<ChapterModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$BookChapterModelImplCopyWith<_$BookChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) {
  return _ChapterModel.fromJson(json);
}

/// @nodoc
mixin _$ChapterModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bibleId')
  String? get bibleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookId')
  String? get bookId => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String? get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterModelCopyWith<ChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterModelCopyWith<$Res> {
  factory $ChapterModelCopyWith(
          ChapterModel value, $Res Function(ChapterModel) then) =
      _$ChapterModelCopyWithImpl<$Res, ChapterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'bibleId') String? bibleId,
      @JsonKey(name: 'bookId') String? bookId,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'reference') String? reference});
}

/// @nodoc
class _$ChapterModelCopyWithImpl<$Res, $Val extends ChapterModel>
    implements $ChapterModelCopyWith<$Res> {
  _$ChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bibleId = freezed,
    Object? bookId = freezed,
    Object? number = freezed,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bibleId: freezed == bibleId
          ? _value.bibleId
          : bibleId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterModelImplCopyWith<$Res>
    implements $ChapterModelCopyWith<$Res> {
  factory _$$ChapterModelImplCopyWith(
          _$ChapterModelImpl value, $Res Function(_$ChapterModelImpl) then) =
      __$$ChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'bibleId') String? bibleId,
      @JsonKey(name: 'bookId') String? bookId,
      @JsonKey(name: 'number') String? number,
      @JsonKey(name: 'reference') String? reference});
}

/// @nodoc
class __$$ChapterModelImplCopyWithImpl<$Res>
    extends _$ChapterModelCopyWithImpl<$Res, _$ChapterModelImpl>
    implements _$$ChapterModelImplCopyWith<$Res> {
  __$$ChapterModelImplCopyWithImpl(
      _$ChapterModelImpl _value, $Res Function(_$ChapterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bibleId = freezed,
    Object? bookId = freezed,
    Object? number = freezed,
    Object? reference = freezed,
  }) {
    return _then(_$ChapterModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bibleId: freezed == bibleId
          ? _value.bibleId
          : bibleId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterModelImpl implements _ChapterModel {
  const _$ChapterModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'bibleId') this.bibleId,
      @JsonKey(name: 'bookId') this.bookId,
      @JsonKey(name: 'number') this.number,
      @JsonKey(name: 'reference') this.reference});

  factory _$ChapterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'bibleId')
  final String? bibleId;
  @override
  @JsonKey(name: 'bookId')
  final String? bookId;
  @override
  @JsonKey(name: 'number')
  final String? number;
  @override
  @JsonKey(name: 'reference')
  final String? reference;

  @override
  String toString() {
    return 'ChapterModel(id: $id, bibleId: $bibleId, bookId: $bookId, number: $number, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bibleId, bibleId) || other.bibleId == bibleId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bibleId, bookId, number, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      __$$ChapterModelImplCopyWithImpl<_$ChapterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterModelImplToJson(
      this,
    );
  }
}

abstract class _ChapterModel implements ChapterModel {
  const factory _ChapterModel(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'bibleId') final String? bibleId,
          @JsonKey(name: 'bookId') final String? bookId,
          @JsonKey(name: 'number') final String? number,
          @JsonKey(name: 'reference') final String? reference}) =
      _$ChapterModelImpl;

  factory _ChapterModel.fromJson(Map<String, dynamic> json) =
      _$ChapterModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'bibleId')
  String? get bibleId;
  @override
  @JsonKey(name: 'bookId')
  String? get bookId;
  @override
  @JsonKey(name: 'number')
  String? get number;
  @override
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(ignore: true)
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
