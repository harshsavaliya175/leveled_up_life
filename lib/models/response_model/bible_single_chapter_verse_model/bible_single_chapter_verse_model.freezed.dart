// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_single_chapter_verse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleVerseModel _$SingleVerseModelFromJson(Map<String, dynamic> json) {
  return _SingleVerseModel.fromJson(json);
}

/// @nodoc
mixin _$SingleVerseModel {
  @JsonKey(name: 'pk')
  int? get pk => throw _privateConstructorUsedError;
  @JsonKey(name: 'verse')
  int? get verse => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleVerseModelCopyWith<SingleVerseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleVerseModelCopyWith<$Res> {
  factory $SingleVerseModelCopyWith(
          SingleVerseModel value, $Res Function(SingleVerseModel) then) =
      _$SingleVerseModelCopyWithImpl<$Res, SingleVerseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') int? pk,
      @JsonKey(name: 'verse') int? verse,
      @JsonKey(name: 'text') String? text});
}

/// @nodoc
class _$SingleVerseModelCopyWithImpl<$Res, $Val extends SingleVerseModel>
    implements $SingleVerseModelCopyWith<$Res> {
  _$SingleVerseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = freezed,
    Object? verse = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      pk: freezed == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int?,
      verse: freezed == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleVerseModelImplCopyWith<$Res>
    implements $SingleVerseModelCopyWith<$Res> {
  factory _$$SingleVerseModelImplCopyWith(_$SingleVerseModelImpl value,
          $Res Function(_$SingleVerseModelImpl) then) =
      __$$SingleVerseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pk') int? pk,
      @JsonKey(name: 'verse') int? verse,
      @JsonKey(name: 'text') String? text});
}

/// @nodoc
class __$$SingleVerseModelImplCopyWithImpl<$Res>
    extends _$SingleVerseModelCopyWithImpl<$Res, _$SingleVerseModelImpl>
    implements _$$SingleVerseModelImplCopyWith<$Res> {
  __$$SingleVerseModelImplCopyWithImpl(_$SingleVerseModelImpl _value,
      $Res Function(_$SingleVerseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = freezed,
    Object? verse = freezed,
    Object? text = freezed,
  }) {
    return _then(_$SingleVerseModelImpl(
      pk: freezed == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int?,
      verse: freezed == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleVerseModelImpl implements _SingleVerseModel {
  const _$SingleVerseModelImpl(
      {@JsonKey(name: 'pk') this.pk,
      @JsonKey(name: 'verse') this.verse,
      @JsonKey(name: 'text') this.text});

  factory _$SingleVerseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleVerseModelImplFromJson(json);

  @override
  @JsonKey(name: 'pk')
  final int? pk;
  @override
  @JsonKey(name: 'verse')
  final int? verse;
  @override
  @JsonKey(name: 'text')
  final String? text;

  @override
  String toString() {
    return 'SingleVerseModel(pk: $pk, verse: $verse, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleVerseModelImpl &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.verse, verse) || other.verse == verse) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pk, verse, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleVerseModelImplCopyWith<_$SingleVerseModelImpl> get copyWith =>
      __$$SingleVerseModelImplCopyWithImpl<_$SingleVerseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleVerseModelImplToJson(
      this,
    );
  }
}

abstract class _SingleVerseModel implements SingleVerseModel {
  const factory _SingleVerseModel(
      {@JsonKey(name: 'pk') final int? pk,
      @JsonKey(name: 'verse') final int? verse,
      @JsonKey(name: 'text') final String? text}) = _$SingleVerseModelImpl;

  factory _SingleVerseModel.fromJson(Map<String, dynamic> json) =
      _$SingleVerseModelImpl.fromJson;

  @override
  @JsonKey(name: 'pk')
  int? get pk;
  @override
  @JsonKey(name: 'verse')
  int? get verse;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$SingleVerseModelImplCopyWith<_$SingleVerseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
