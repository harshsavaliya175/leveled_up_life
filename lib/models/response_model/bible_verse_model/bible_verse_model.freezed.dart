// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_verse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BibleVerseModel _$BibleVerseModelFromJson(Map<String, dynamic> json) {
  return _BibleVerseModel.fromJson(json);
}

/// @nodoc
mixin _$BibleVerseModel {
  @JsonKey(name: 'day')
  int get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BibleVerseModelCopyWith<BibleVerseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleVerseModelCopyWith<$Res> {
  factory $BibleVerseModelCopyWith(
          BibleVerseModel value, $Res Function(BibleVerseModel) then) =
      _$BibleVerseModelCopyWithImpl<$Res, BibleVerseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day') int day, @JsonKey(name: 'title') String title});
}

/// @nodoc
class _$BibleVerseModelCopyWithImpl<$Res, $Val extends BibleVerseModel>
    implements $BibleVerseModelCopyWith<$Res> {
  _$BibleVerseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleVerseModelImplCopyWith<$Res>
    implements $BibleVerseModelCopyWith<$Res> {
  factory _$$BibleVerseModelImplCopyWith(_$BibleVerseModelImpl value,
          $Res Function(_$BibleVerseModelImpl) then) =
      __$$BibleVerseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day') int day, @JsonKey(name: 'title') String title});
}

/// @nodoc
class __$$BibleVerseModelImplCopyWithImpl<$Res>
    extends _$BibleVerseModelCopyWithImpl<$Res, _$BibleVerseModelImpl>
    implements _$$BibleVerseModelImplCopyWith<$Res> {
  __$$BibleVerseModelImplCopyWithImpl(
      _$BibleVerseModelImpl _value, $Res Function(_$BibleVerseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? title = null,
  }) {
    return _then(_$BibleVerseModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BibleVerseModelImpl implements _BibleVerseModel {
  const _$BibleVerseModelImpl(
      {@JsonKey(name: 'day') this.day = 0,
      @JsonKey(name: 'title') this.title = ''});

  factory _$BibleVerseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleVerseModelImplFromJson(json);

  @override
  @JsonKey(name: 'day')
  final int day;
  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  String toString() {
    return 'BibleVerseModel(day: $day, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleVerseModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleVerseModelImplCopyWith<_$BibleVerseModelImpl> get copyWith =>
      __$$BibleVerseModelImplCopyWithImpl<_$BibleVerseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleVerseModelImplToJson(
      this,
    );
  }
}

abstract class _BibleVerseModel implements BibleVerseModel {
  const factory _BibleVerseModel(
      {@JsonKey(name: 'day') final int day,
      @JsonKey(name: 'title') final String title}) = _$BibleVerseModelImpl;

  factory _BibleVerseModel.fromJson(Map<String, dynamic> json) =
      _$BibleVerseModelImpl.fromJson;

  @override
  @JsonKey(name: 'day')
  int get day;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$BibleVerseModelImplCopyWith<_$BibleVerseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
