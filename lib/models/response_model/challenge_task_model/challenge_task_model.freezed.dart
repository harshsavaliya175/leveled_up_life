// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeTaskModel _$ChallengeTaskModelFromJson(Map<String, dynamic> json) {
  return _ChallengeTaskModel.fromJson(json);
}

/// @nodoc
mixin _$ChallengeTaskModel {
  @JsonKey(name: 'challenge_task_id')
  int? get challengeTaskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_id')
  int? get challengeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_task_name')
  String? get challengeTaskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_complete')
  int? get isComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeTaskModelCopyWith<ChallengeTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeTaskModelCopyWith<$Res> {
  factory $ChallengeTaskModelCopyWith(
          ChallengeTaskModel value, $Res Function(ChallengeTaskModel) then) =
      _$ChallengeTaskModelCopyWithImpl<$Res, ChallengeTaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_task_id') int? challengeTaskId,
      @JsonKey(name: 'challenge_id') int? challengeId,
      @JsonKey(name: 'challenge_task_name') String? challengeTaskName,
      @JsonKey(name: 'is_complete') int? isComplete});
}

/// @nodoc
class _$ChallengeTaskModelCopyWithImpl<$Res, $Val extends ChallengeTaskModel>
    implements $ChallengeTaskModelCopyWith<$Res> {
  _$ChallengeTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeTaskId = freezed,
    Object? challengeId = freezed,
    Object? challengeTaskName = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_value.copyWith(
      challengeTaskId: freezed == challengeTaskId
          ? _value.challengeTaskId
          : challengeTaskId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeTaskName: freezed == challengeTaskName
          ? _value.challengeTaskName
          : challengeTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeTaskModelImplCopyWith<$Res>
    implements $ChallengeTaskModelCopyWith<$Res> {
  factory _$$ChallengeTaskModelImplCopyWith(_$ChallengeTaskModelImpl value,
          $Res Function(_$ChallengeTaskModelImpl) then) =
      __$$ChallengeTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_task_id') int? challengeTaskId,
      @JsonKey(name: 'challenge_id') int? challengeId,
      @JsonKey(name: 'challenge_task_name') String? challengeTaskName,
      @JsonKey(name: 'is_complete') int? isComplete});
}

/// @nodoc
class __$$ChallengeTaskModelImplCopyWithImpl<$Res>
    extends _$ChallengeTaskModelCopyWithImpl<$Res, _$ChallengeTaskModelImpl>
    implements _$$ChallengeTaskModelImplCopyWith<$Res> {
  __$$ChallengeTaskModelImplCopyWithImpl(_$ChallengeTaskModelImpl _value,
      $Res Function(_$ChallengeTaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeTaskId = freezed,
    Object? challengeId = freezed,
    Object? challengeTaskName = freezed,
    Object? isComplete = freezed,
  }) {
    return _then(_$ChallengeTaskModelImpl(
      challengeTaskId: freezed == challengeTaskId
          ? _value.challengeTaskId
          : challengeTaskId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeTaskName: freezed == challengeTaskName
          ? _value.challengeTaskName
          : challengeTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      isComplete: freezed == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeTaskModelImpl implements _ChallengeTaskModel {
  const _$ChallengeTaskModelImpl(
      {@JsonKey(name: 'challenge_task_id') this.challengeTaskId,
      @JsonKey(name: 'challenge_id') this.challengeId,
      @JsonKey(name: 'challenge_task_name') this.challengeTaskName,
      @JsonKey(name: 'is_complete') this.isComplete});

  factory _$ChallengeTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeTaskModelImplFromJson(json);

  @override
  @JsonKey(name: 'challenge_task_id')
  final int? challengeTaskId;
  @override
  @JsonKey(name: 'challenge_id')
  final int? challengeId;
  @override
  @JsonKey(name: 'challenge_task_name')
  final String? challengeTaskName;
  @override
  @JsonKey(name: 'is_complete')
  final int? isComplete;

  @override
  String toString() {
    return 'ChallengeTaskModel(challengeTaskId: $challengeTaskId, challengeId: $challengeId, challengeTaskName: $challengeTaskName, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeTaskModelImpl &&
            (identical(other.challengeTaskId, challengeTaskId) ||
                other.challengeTaskId == challengeTaskId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.challengeTaskName, challengeTaskName) ||
                other.challengeTaskName == challengeTaskName) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, challengeTaskId, challengeId, challengeTaskName, isComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeTaskModelImplCopyWith<_$ChallengeTaskModelImpl> get copyWith =>
      __$$ChallengeTaskModelImplCopyWithImpl<_$ChallengeTaskModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeTaskModelImplToJson(
      this,
    );
  }
}

abstract class _ChallengeTaskModel implements ChallengeTaskModel {
  const factory _ChallengeTaskModel(
          {@JsonKey(name: 'challenge_task_id') final int? challengeTaskId,
          @JsonKey(name: 'challenge_id') final int? challengeId,
          @JsonKey(name: 'challenge_task_name') final String? challengeTaskName,
          @JsonKey(name: 'is_complete') final int? isComplete}) =
      _$ChallengeTaskModelImpl;

  factory _ChallengeTaskModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeTaskModelImpl.fromJson;

  @override
  @JsonKey(name: 'challenge_task_id')
  int? get challengeTaskId;
  @override
  @JsonKey(name: 'challenge_id')
  int? get challengeId;
  @override
  @JsonKey(name: 'challenge_task_name')
  String? get challengeTaskName;
  @override
  @JsonKey(name: 'is_complete')
  int? get isComplete;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeTaskModelImplCopyWith<_$ChallengeTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
