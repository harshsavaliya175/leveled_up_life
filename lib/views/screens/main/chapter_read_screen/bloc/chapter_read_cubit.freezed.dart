// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_read_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChapterReadState {
  List<SingleVerseModel?> get singleVerseDataList =>
      throw _privateConstructorUsedError;
  int get chapterId => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterReadStateCopyWith<ChapterReadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterReadStateCopyWith<$Res> {
  factory $ChapterReadStateCopyWith(
          ChapterReadState value, $Res Function(ChapterReadState) then) =
      _$ChapterReadStateCopyWithImpl<$Res, ChapterReadState>;
  @useResult
  $Res call(
      {List<SingleVerseModel?> singleVerseDataList,
      int chapterId,
      int bookId,
      String name});
}

/// @nodoc
class _$ChapterReadStateCopyWithImpl<$Res, $Val extends ChapterReadState>
    implements $ChapterReadStateCopyWith<$Res> {
  _$ChapterReadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleVerseDataList = null,
    Object? chapterId = null,
    Object? bookId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      singleVerseDataList: null == singleVerseDataList
          ? _value.singleVerseDataList
          : singleVerseDataList // ignore: cast_nullable_to_non_nullable
              as List<SingleVerseModel?>,
      chapterId: null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterReadStateImplCopyWith<$Res>
    implements $ChapterReadStateCopyWith<$Res> {
  factory _$$ChapterReadStateImplCopyWith(_$ChapterReadStateImpl value,
          $Res Function(_$ChapterReadStateImpl) then) =
      __$$ChapterReadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SingleVerseModel?> singleVerseDataList,
      int chapterId,
      int bookId,
      String name});
}

/// @nodoc
class __$$ChapterReadStateImplCopyWithImpl<$Res>
    extends _$ChapterReadStateCopyWithImpl<$Res, _$ChapterReadStateImpl>
    implements _$$ChapterReadStateImplCopyWith<$Res> {
  __$$ChapterReadStateImplCopyWithImpl(_$ChapterReadStateImpl _value,
      $Res Function(_$ChapterReadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleVerseDataList = null,
    Object? chapterId = null,
    Object? bookId = null,
    Object? name = null,
  }) {
    return _then(_$ChapterReadStateImpl(
      singleVerseDataList: null == singleVerseDataList
          ? _value._singleVerseDataList
          : singleVerseDataList // ignore: cast_nullable_to_non_nullable
              as List<SingleVerseModel?>,
      chapterId: null == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChapterReadStateImpl implements _ChapterReadState {
  const _$ChapterReadStateImpl(
      {final List<SingleVerseModel?> singleVerseDataList = const [],
      this.chapterId = 0,
      this.bookId = 0,
      this.name = ''})
      : _singleVerseDataList = singleVerseDataList;

  final List<SingleVerseModel?> _singleVerseDataList;
  @override
  @JsonKey()
  List<SingleVerseModel?> get singleVerseDataList {
    if (_singleVerseDataList is EqualUnmodifiableListView)
      return _singleVerseDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_singleVerseDataList);
  }

  @override
  @JsonKey()
  final int chapterId;
  @override
  @JsonKey()
  final int bookId;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ChapterReadState(singleVerseDataList: $singleVerseDataList, chapterId: $chapterId, bookId: $bookId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterReadStateImpl &&
            const DeepCollectionEquality()
                .equals(other._singleVerseDataList, _singleVerseDataList) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_singleVerseDataList),
      chapterId,
      bookId,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterReadStateImplCopyWith<_$ChapterReadStateImpl> get copyWith =>
      __$$ChapterReadStateImplCopyWithImpl<_$ChapterReadStateImpl>(
          this, _$identity);
}

abstract class _ChapterReadState implements ChapterReadState {
  const factory _ChapterReadState(
      {final List<SingleVerseModel?> singleVerseDataList,
      final int chapterId,
      final int bookId,
      final String name}) = _$ChapterReadStateImpl;

  @override
  List<SingleVerseModel?> get singleVerseDataList;
  @override
  int get chapterId;
  @override
  int get bookId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ChapterReadStateImplCopyWith<_$ChapterReadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
