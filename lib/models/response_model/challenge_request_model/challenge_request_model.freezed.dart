// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeRequestModel _$ChallengeRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ChallengeRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ChallengeRequestModel {
  @JsonKey(name: 'challenge_friend_id')
  int get challengeFriendId => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_name')
  String get challengeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_day')
  int get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_task_list')
  List<ChallengeTaskModel>? get challengeTaskList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeRequestModelCopyWith<ChallengeRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeRequestModelCopyWith<$Res> {
  factory $ChallengeRequestModelCopyWith(ChallengeRequestModel value,
          $Res Function(ChallengeRequestModel) then) =
      _$ChallengeRequestModelCopyWithImpl<$Res, ChallengeRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_friend_id') int challengeFriendId,
      @JsonKey(name: 'challenge_name') String challengeName,
      @JsonKey(name: 'total_day') int totalDay,
      @JsonKey(name: 'challenge_task_list')
      List<ChallengeTaskModel>? challengeTaskList});
}

/// @nodoc
class _$ChallengeRequestModelCopyWithImpl<$Res,
        $Val extends ChallengeRequestModel>
    implements $ChallengeRequestModelCopyWith<$Res> {
  _$ChallengeRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeFriendId = null,
    Object? challengeName = null,
    Object? totalDay = null,
    Object? challengeTaskList = freezed,
  }) {
    return _then(_value.copyWith(
      challengeFriendId: null == challengeFriendId
          ? _value.challengeFriendId
          : challengeFriendId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeName: null == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalDay: null == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as int,
      challengeTaskList: freezed == challengeTaskList
          ? _value.challengeTaskList
          : challengeTaskList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeTaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeRequestModelImplCopyWith<$Res>
    implements $ChallengeRequestModelCopyWith<$Res> {
  factory _$$ChallengeRequestModelImplCopyWith(
          _$ChallengeRequestModelImpl value,
          $Res Function(_$ChallengeRequestModelImpl) then) =
      __$$ChallengeRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_friend_id') int challengeFriendId,
      @JsonKey(name: 'challenge_name') String challengeName,
      @JsonKey(name: 'total_day') int totalDay,
      @JsonKey(name: 'challenge_task_list')
      List<ChallengeTaskModel>? challengeTaskList});
}

/// @nodoc
class __$$ChallengeRequestModelImplCopyWithImpl<$Res>
    extends _$ChallengeRequestModelCopyWithImpl<$Res,
        _$ChallengeRequestModelImpl>
    implements _$$ChallengeRequestModelImplCopyWith<$Res> {
  __$$ChallengeRequestModelImplCopyWithImpl(_$ChallengeRequestModelImpl _value,
      $Res Function(_$ChallengeRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeFriendId = null,
    Object? challengeName = null,
    Object? totalDay = null,
    Object? challengeTaskList = freezed,
  }) {
    return _then(_$ChallengeRequestModelImpl(
      challengeFriendId: null == challengeFriendId
          ? _value.challengeFriendId
          : challengeFriendId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeName: null == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalDay: null == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as int,
      challengeTaskList: freezed == challengeTaskList
          ? _value._challengeTaskList
          : challengeTaskList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeTaskModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeRequestModelImpl implements _ChallengeRequestModel {
  const _$ChallengeRequestModelImpl(
      {@JsonKey(name: 'challenge_friend_id') this.challengeFriendId = 0,
      @JsonKey(name: 'challenge_name') this.challengeName = '',
      @JsonKey(name: 'total_day') this.totalDay = 0,
      @JsonKey(name: 'challenge_task_list')
      final List<ChallengeTaskModel>? challengeTaskList})
      : _challengeTaskList = challengeTaskList;

  factory _$ChallengeRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'challenge_friend_id')
  final int challengeFriendId;
  @override
  @JsonKey(name: 'challenge_name')
  final String challengeName;
  @override
  @JsonKey(name: 'total_day')
  final int totalDay;
  final List<ChallengeTaskModel>? _challengeTaskList;
  @override
  @JsonKey(name: 'challenge_task_list')
  List<ChallengeTaskModel>? get challengeTaskList {
    final value = _challengeTaskList;
    if (value == null) return null;
    if (_challengeTaskList is EqualUnmodifiableListView)
      return _challengeTaskList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChallengeRequestModel(challengeFriendId: $challengeFriendId, challengeName: $challengeName, totalDay: $totalDay, challengeTaskList: $challengeTaskList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeRequestModelImpl &&
            (identical(other.challengeFriendId, challengeFriendId) ||
                other.challengeFriendId == challengeFriendId) &&
            (identical(other.challengeName, challengeName) ||
                other.challengeName == challengeName) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            const DeepCollectionEquality()
                .equals(other._challengeTaskList, _challengeTaskList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, challengeFriendId, challengeName,
      totalDay, const DeepCollectionEquality().hash(_challengeTaskList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeRequestModelImplCopyWith<_$ChallengeRequestModelImpl>
      get copyWith => __$$ChallengeRequestModelImplCopyWithImpl<
          _$ChallengeRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ChallengeRequestModel implements ChallengeRequestModel {
  const factory _ChallengeRequestModel(
          {@JsonKey(name: 'challenge_friend_id') final int challengeFriendId,
          @JsonKey(name: 'challenge_name') final String challengeName,
          @JsonKey(name: 'total_day') final int totalDay,
          @JsonKey(name: 'challenge_task_list')
          final List<ChallengeTaskModel>? challengeTaskList}) =
      _$ChallengeRequestModelImpl;

  factory _ChallengeRequestModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'challenge_friend_id')
  int get challengeFriendId;
  @override
  @JsonKey(name: 'challenge_name')
  String get challengeName;
  @override
  @JsonKey(name: 'total_day')
  int get totalDay;
  @override
  @JsonKey(name: 'challenge_task_list')
  List<ChallengeTaskModel>? get challengeTaskList;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeRequestModelImplCopyWith<_$ChallengeRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
