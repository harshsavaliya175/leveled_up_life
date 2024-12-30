// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BibleScreenState {
  List<Books> get bibleBooks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BibleScreenStateCopyWith<BibleScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleScreenStateCopyWith<$Res> {
  factory $BibleScreenStateCopyWith(
          BibleScreenState value, $Res Function(BibleScreenState) then) =
      _$BibleScreenStateCopyWithImpl<$Res, BibleScreenState>;
  @useResult
  $Res call({List<Books> bibleBooks});
}

/// @nodoc
class _$BibleScreenStateCopyWithImpl<$Res, $Val extends BibleScreenState>
    implements $BibleScreenStateCopyWith<$Res> {
  _$BibleScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bibleBooks = null,
  }) {
    return _then(_value.copyWith(
      bibleBooks: null == bibleBooks
          ? _value.bibleBooks
          : bibleBooks // ignore: cast_nullable_to_non_nullable
              as List<Books>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleScreenStateImplCopyWith<$Res>
    implements $BibleScreenStateCopyWith<$Res> {
  factory _$$BibleScreenStateImplCopyWith(_$BibleScreenStateImpl value,
          $Res Function(_$BibleScreenStateImpl) then) =
      __$$BibleScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Books> bibleBooks});
}

/// @nodoc
class __$$BibleScreenStateImplCopyWithImpl<$Res>
    extends _$BibleScreenStateCopyWithImpl<$Res, _$BibleScreenStateImpl>
    implements _$$BibleScreenStateImplCopyWith<$Res> {
  __$$BibleScreenStateImplCopyWithImpl(_$BibleScreenStateImpl _value,
      $Res Function(_$BibleScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bibleBooks = null,
  }) {
    return _then(_$BibleScreenStateImpl(
      bibleBooks: null == bibleBooks
          ? _value._bibleBooks
          : bibleBooks // ignore: cast_nullable_to_non_nullable
              as List<Books>,
    ));
  }
}

/// @nodoc

class _$BibleScreenStateImpl implements _BibleScreenState {
  const _$BibleScreenStateImpl({final List<Books> bibleBooks = const []})
      : _bibleBooks = bibleBooks;

  final List<Books> _bibleBooks;
  @override
  @JsonKey()
  List<Books> get bibleBooks {
    if (_bibleBooks is EqualUnmodifiableListView) return _bibleBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bibleBooks);
  }

  @override
  String toString() {
    return 'BibleScreenState(bibleBooks: $bibleBooks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bibleBooks, _bibleBooks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_bibleBooks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleScreenStateImplCopyWith<_$BibleScreenStateImpl> get copyWith =>
      __$$BibleScreenStateImplCopyWithImpl<_$BibleScreenStateImpl>(
          this, _$identity);
}

abstract class _BibleScreenState implements BibleScreenState {
  const factory _BibleScreenState({final List<Books> bibleBooks}) =
      _$BibleScreenStateImpl;

  @override
  List<Books> get bibleBooks;
  @override
  @JsonKey(ignore: true)
  _$$BibleScreenStateImplCopyWith<_$BibleScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
