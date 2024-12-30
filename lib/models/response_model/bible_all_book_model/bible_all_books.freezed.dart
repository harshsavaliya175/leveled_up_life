// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_all_books.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Books _$BooksFromJson(Map<String, dynamic> json) {
  return _Books.fromJson(json);
}

/// @nodoc
mixin _$Books {
  @JsonKey(name: 'bookid')
  int? get bookId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'chronorder')
  int? get chronorder => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapters')
  int? get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BooksCopyWith<Books> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksCopyWith<$Res> {
  factory $BooksCopyWith(Books value, $Res Function(Books) then) =
      _$BooksCopyWithImpl<$Res, Books>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookid') int? bookId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'chronorder') int? chronorder,
      @JsonKey(name: 'chapters') int? chapters});
}

/// @nodoc
class _$BooksCopyWithImpl<$Res, $Val extends Books>
    implements $BooksCopyWith<$Res> {
  _$BooksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = freezed,
    Object? name = freezed,
    Object? chronorder = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_value.copyWith(
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      chronorder: freezed == chronorder
          ? _value.chronorder
          : chronorder // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksImplCopyWith<$Res> implements $BooksCopyWith<$Res> {
  factory _$$BooksImplCopyWith(
          _$BooksImpl value, $Res Function(_$BooksImpl) then) =
      __$$BooksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookid') int? bookId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'chronorder') int? chronorder,
      @JsonKey(name: 'chapters') int? chapters});
}

/// @nodoc
class __$$BooksImplCopyWithImpl<$Res>
    extends _$BooksCopyWithImpl<$Res, _$BooksImpl>
    implements _$$BooksImplCopyWith<$Res> {
  __$$BooksImplCopyWithImpl(
      _$BooksImpl _value, $Res Function(_$BooksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = freezed,
    Object? name = freezed,
    Object? chronorder = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_$BooksImpl(
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      chronorder: freezed == chronorder
          ? _value.chronorder
          : chronorder // ignore: cast_nullable_to_non_nullable
              as int?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksImpl implements _Books {
  const _$BooksImpl(
      {@JsonKey(name: 'bookid') this.bookId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'chronorder') this.chronorder,
      @JsonKey(name: 'chapters') this.chapters});

  factory _$BooksImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksImplFromJson(json);

  @override
  @JsonKey(name: 'bookid')
  final int? bookId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'chronorder')
  final int? chronorder;
  @override
  @JsonKey(name: 'chapters')
  final int? chapters;

  @override
  String toString() {
    return 'Books(bookId: $bookId, name: $name, chronorder: $chronorder, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chronorder, chronorder) ||
                other.chronorder == chronorder) &&
            (identical(other.chapters, chapters) ||
                other.chapters == chapters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bookId, name, chronorder, chapters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksImplCopyWith<_$BooksImpl> get copyWith =>
      __$$BooksImplCopyWithImpl<_$BooksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BooksImplToJson(
      this,
    );
  }
}

abstract class _Books implements Books {
  const factory _Books(
      {@JsonKey(name: 'bookid') final int? bookId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'chronorder') final int? chronorder,
      @JsonKey(name: 'chapters') final int? chapters}) = _$BooksImpl;

  factory _Books.fromJson(Map<String, dynamic> json) = _$BooksImpl.fromJson;

  @override
  @JsonKey(name: 'bookid')
  int? get bookId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'chronorder')
  int? get chronorder;
  @override
  @JsonKey(name: 'chapters')
  int? get chapters;
  @override
  @JsonKey(ignore: true)
  _$$BooksImplCopyWith<_$BooksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
