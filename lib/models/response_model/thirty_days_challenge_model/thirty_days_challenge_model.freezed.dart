// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thirty_days_challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThirtyDaysChallengeModel _$ThirtyDaysChallengeModelFromJson(
    Map<String, dynamic> json) {
  return _ThirtyDaysChallengeModel.fromJson(json);
}

/// @nodoc
mixin _$ThirtyDaysChallengeModel {
  @JsonKey(name: 'days_challenge_id')
  int get daysChallengeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  int get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThirtyDaysChallengeModelCopyWith<ThirtyDaysChallengeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThirtyDaysChallengeModelCopyWith<$Res> {
  factory $ThirtyDaysChallengeModelCopyWith(ThirtyDaysChallengeModel value,
          $Res Function(ThirtyDaysChallengeModel) then) =
      _$ThirtyDaysChallengeModelCopyWithImpl<$Res, ThirtyDaysChallengeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'days_challenge_id') int daysChallengeId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'is_complete') int isComplete});
}

/// @nodoc
class _$ThirtyDaysChallengeModelCopyWithImpl<$Res,
        $Val extends ThirtyDaysChallengeModel>
    implements $ThirtyDaysChallengeModelCopyWith<$Res> {
  _$ThirtyDaysChallengeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysChallengeId = null,
    Object? title = null,
    Object? type = null,
    Object? isComplete = null,
  }) {
    return _then(_value.copyWith(
      daysChallengeId: null == daysChallengeId
          ? _value.daysChallengeId
          : daysChallengeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThirtyDaysChallengeModelImplCopyWith<$Res>
    implements $ThirtyDaysChallengeModelCopyWith<$Res> {
  factory _$$ThirtyDaysChallengeModelImplCopyWith(
          _$ThirtyDaysChallengeModelImpl value,
          $Res Function(_$ThirtyDaysChallengeModelImpl) then) =
      __$$ThirtyDaysChallengeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'days_challenge_id') int daysChallengeId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'is_complete') int isComplete});
}

/// @nodoc
class __$$ThirtyDaysChallengeModelImplCopyWithImpl<$Res>
    extends _$ThirtyDaysChallengeModelCopyWithImpl<$Res,
        _$ThirtyDaysChallengeModelImpl>
    implements _$$ThirtyDaysChallengeModelImplCopyWith<$Res> {
  __$$ThirtyDaysChallengeModelImplCopyWithImpl(
      _$ThirtyDaysChallengeModelImpl _value,
      $Res Function(_$ThirtyDaysChallengeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysChallengeId = null,
    Object? title = null,
    Object? type = null,
    Object? isComplete = null,
  }) {
    return _then(_$ThirtyDaysChallengeModelImpl(
      daysChallengeId: null == daysChallengeId
          ? _value.daysChallengeId
          : daysChallengeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThirtyDaysChallengeModelImpl implements _ThirtyDaysChallengeModel {
  const _$ThirtyDaysChallengeModelImpl(
      {@JsonKey(name: 'days_challenge_id') this.daysChallengeId = 0,
      @JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'is_complete') this.isComplete = 0});

  factory _$ThirtyDaysChallengeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThirtyDaysChallengeModelImplFromJson(json);

  @override
  @JsonKey(name: 'days_challenge_id')
  final int daysChallengeId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'is_complete')
  final int isComplete;

  @override
  String toString() {
    return 'ThirtyDaysChallengeModel(daysChallengeId: $daysChallengeId, title: $title, type: $type, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThirtyDaysChallengeModelImpl &&
            (identical(other.daysChallengeId, daysChallengeId) ||
                other.daysChallengeId == daysChallengeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, daysChallengeId, title, type, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThirtyDaysChallengeModelImplCopyWith<_$ThirtyDaysChallengeModelImpl>
      get copyWith => __$$ThirtyDaysChallengeModelImplCopyWithImpl<
          _$ThirtyDaysChallengeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThirtyDaysChallengeModelImplToJson(
      this,
    );
  }
}

abstract class _ThirtyDaysChallengeModel implements ThirtyDaysChallengeModel {
  const factory _ThirtyDaysChallengeModel(
          {@JsonKey(name: 'days_challenge_id') final int daysChallengeId,
          @JsonKey(name: 'title') final String title,
          @JsonKey(name: 'type') final String type,
          @JsonKey(name: 'is_complete') final int isComplete}) =
      _$ThirtyDaysChallengeModelImpl;

  factory _ThirtyDaysChallengeModel.fromJson(Map<String, dynamic> json) =
      _$ThirtyDaysChallengeModelImpl.fromJson;

  @override
  @JsonKey(name: 'days_challenge_id')
  int get daysChallengeId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'is_complete')
  int get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$ThirtyDaysChallengeModelImplCopyWith<_$ThirtyDaysChallengeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
