// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapters_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChaptersState {
// @Default([]) List<ChapterModel> chapterList,
  String get name => throw _privateConstructorUsedError;
  int get chapters => throw _privateConstructorUsedError;
  int get bookId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChaptersStateCopyWith<ChaptersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaptersStateCopyWith<$Res> {
  factory $ChaptersStateCopyWith(
          ChaptersState value, $Res Function(ChaptersState) then) =
      _$ChaptersStateCopyWithImpl<$Res, ChaptersState>;
  @useResult
  $Res call({String name, int chapters, int bookId});
}

/// @nodoc
class _$ChaptersStateCopyWithImpl<$Res, $Val extends ChaptersState>
    implements $ChaptersStateCopyWith<$Res> {
  _$ChaptersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chapters = null,
    Object? bookId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChaptersStateImplCopyWith<$Res>
    implements $ChaptersStateCopyWith<$Res> {
  factory _$$ChaptersStateImplCopyWith(
          _$ChaptersStateImpl value, $Res Function(_$ChaptersStateImpl) then) =
      __$$ChaptersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int chapters, int bookId});
}

/// @nodoc
class __$$ChaptersStateImplCopyWithImpl<$Res>
    extends _$ChaptersStateCopyWithImpl<$Res, _$ChaptersStateImpl>
    implements _$$ChaptersStateImplCopyWith<$Res> {
  __$$ChaptersStateImplCopyWithImpl(
      _$ChaptersStateImpl _value, $Res Function(_$ChaptersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chapters = null,
    Object? bookId = null,
  }) {
    return _then(_$ChaptersStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChaptersStateImpl implements _ChaptersState {
  const _$ChaptersStateImpl(
      {this.name = '', this.chapters = 0, this.bookId = 0});

// @Default([]) List<ChapterModel> chapterList,
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int chapters;
  @override
  @JsonKey()
  final int bookId;

  @override
  String toString() {
    return 'ChaptersState(name: $name, chapters: $chapters, bookId: $bookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaptersStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chapters, chapters) ||
                other.chapters == chapters) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, chapters, bookId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaptersStateImplCopyWith<_$ChaptersStateImpl> get copyWith =>
      __$$ChaptersStateImplCopyWithImpl<_$ChaptersStateImpl>(this, _$identity);
}

abstract class _ChaptersState implements ChaptersState {
  const factory _ChaptersState(
      {final String name,
      final int chapters,
      final int bookId}) = _$ChaptersStateImpl;

  @override // @Default([]) List<ChapterModel> chapterList,
  String get name;
  @override
  int get chapters;
  @override
  int get bookId;
  @override
  @JsonKey(ignore: true)
  _$$ChaptersStateImplCopyWith<_$ChaptersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
