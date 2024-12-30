// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) {
  return _ChallengeModel.fromJson(json);
}

/// @nodoc
mixin _$ChallengeModel {
  @JsonKey(name: 'challenge_id')
  int? get challengeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String? get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_name')
  String? get challengeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_name')
  String? get taskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_startdate')
  String? get challengeStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_enddate')
  String? get challengeEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_day')
  int? get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_set_reminder')
  int? get isSetReminder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_challenge_complete')
  int? get isChallengeComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_day')
  int? get currentDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_today_challenge_complete')
  int? get isTodayChallengeComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_count')
  int? get dayCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'participate_list')
  List<ParticipateModel>? get participateList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_task_list')
  List<ChallengeTaskModel>? get challengeTaskList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeModelCopyWith<ChallengeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeModelCopyWith<$Res> {
  factory $ChallengeModelCopyWith(
          ChallengeModel value, $Res Function(ChallengeModel) then) =
      _$ChallengeModelCopyWithImpl<$Res, ChallengeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_id') int? challengeId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'challenge_name') String? challengeName,
      @JsonKey(name: 'task_name') String? taskName,
      @JsonKey(name: 'challenge_startdate') String? challengeStartDate,
      @JsonKey(name: 'challenge_enddate') String? challengeEndDate,
      @JsonKey(name: 'total_day') int? totalDay,
      @JsonKey(name: 'is_set_reminder') int? isSetReminder,
      @JsonKey(name: 'is_challenge_complete') int? isChallengeComplete,
      @JsonKey(name: 'current_day') int? currentDay,
      @JsonKey(name: 'is_today_challenge_complete')
      int? isTodayChallengeComplete,
      @JsonKey(name: 'days_count') int? dayCount,
      @JsonKey(name: 'participate_list')
      List<ParticipateModel>? participateList,
      @JsonKey(name: 'challenge_task_list')
      List<ChallengeTaskModel>? challengeTaskList});
}

/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res, $Val extends ChallengeModel>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? userToken = freezed,
    Object? challengeName = freezed,
    Object? taskName = freezed,
    Object? challengeStartDate = freezed,
    Object? challengeEndDate = freezed,
    Object? totalDay = freezed,
    Object? isSetReminder = freezed,
    Object? isChallengeComplete = freezed,
    Object? currentDay = freezed,
    Object? isTodayChallengeComplete = freezed,
    Object? dayCount = freezed,
    Object? participateList = freezed,
    Object? challengeTaskList = freezed,
  }) {
    return _then(_value.copyWith(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeName: freezed == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeStartDate: freezed == challengeStartDate
          ? _value.challengeStartDate
          : challengeStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeEndDate: freezed == challengeEndDate
          ? _value.challengeEndDate
          : challengeEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isSetReminder: freezed == isSetReminder
          ? _value.isSetReminder
          : isSetReminder // ignore: cast_nullable_to_non_nullable
              as int?,
      isChallengeComplete: freezed == isChallengeComplete
          ? _value.isChallengeComplete
          : isChallengeComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      currentDay: freezed == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isTodayChallengeComplete: freezed == isTodayChallengeComplete
          ? _value.isTodayChallengeComplete
          : isTodayChallengeComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      dayCount: freezed == dayCount
          ? _value.dayCount
          : dayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participateList: freezed == participateList
          ? _value.participateList
          : participateList // ignore: cast_nullable_to_non_nullable
              as List<ParticipateModel>?,
      challengeTaskList: freezed == challengeTaskList
          ? _value.challengeTaskList
          : challengeTaskList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeTaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeModelImplCopyWith<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  factory _$$ChallengeModelImplCopyWith(_$ChallengeModelImpl value,
          $Res Function(_$ChallengeModelImpl) then) =
      __$$ChallengeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_id') int? challengeId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'challenge_name') String? challengeName,
      @JsonKey(name: 'task_name') String? taskName,
      @JsonKey(name: 'challenge_startdate') String? challengeStartDate,
      @JsonKey(name: 'challenge_enddate') String? challengeEndDate,
      @JsonKey(name: 'total_day') int? totalDay,
      @JsonKey(name: 'is_set_reminder') int? isSetReminder,
      @JsonKey(name: 'is_challenge_complete') int? isChallengeComplete,
      @JsonKey(name: 'current_day') int? currentDay,
      @JsonKey(name: 'is_today_challenge_complete')
      int? isTodayChallengeComplete,
      @JsonKey(name: 'days_count') int? dayCount,
      @JsonKey(name: 'participate_list')
      List<ParticipateModel>? participateList,
      @JsonKey(name: 'challenge_task_list')
      List<ChallengeTaskModel>? challengeTaskList});
}

/// @nodoc
class __$$ChallengeModelImplCopyWithImpl<$Res>
    extends _$ChallengeModelCopyWithImpl<$Res, _$ChallengeModelImpl>
    implements _$$ChallengeModelImplCopyWith<$Res> {
  __$$ChallengeModelImplCopyWithImpl(
      _$ChallengeModelImpl _value, $Res Function(_$ChallengeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = freezed,
    Object? userToken = freezed,
    Object? challengeName = freezed,
    Object? taskName = freezed,
    Object? challengeStartDate = freezed,
    Object? challengeEndDate = freezed,
    Object? totalDay = freezed,
    Object? isSetReminder = freezed,
    Object? isChallengeComplete = freezed,
    Object? currentDay = freezed,
    Object? isTodayChallengeComplete = freezed,
    Object? dayCount = freezed,
    Object? participateList = freezed,
    Object? challengeTaskList = freezed,
  }) {
    return _then(_$ChallengeModelImpl(
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeName: freezed == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeStartDate: freezed == challengeStartDate
          ? _value.challengeStartDate
          : challengeStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeEndDate: freezed == challengeEndDate
          ? _value.challengeEndDate
          : challengeEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isSetReminder: freezed == isSetReminder
          ? _value.isSetReminder
          : isSetReminder // ignore: cast_nullable_to_non_nullable
              as int?,
      isChallengeComplete: freezed == isChallengeComplete
          ? _value.isChallengeComplete
          : isChallengeComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      currentDay: freezed == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int?,
      isTodayChallengeComplete: freezed == isTodayChallengeComplete
          ? _value.isTodayChallengeComplete
          : isTodayChallengeComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      dayCount: freezed == dayCount
          ? _value.dayCount
          : dayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      participateList: freezed == participateList
          ? _value._participateList
          : participateList // ignore: cast_nullable_to_non_nullable
              as List<ParticipateModel>?,
      challengeTaskList: freezed == challengeTaskList
          ? _value._challengeTaskList
          : challengeTaskList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeTaskModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeModelImpl implements _ChallengeModel {
  const _$ChallengeModelImpl(
      {@JsonKey(name: 'challenge_id') this.challengeId,
      @JsonKey(name: 'user_token') this.userToken,
      @JsonKey(name: 'challenge_name') this.challengeName,
      @JsonKey(name: 'task_name') this.taskName,
      @JsonKey(name: 'challenge_startdate') this.challengeStartDate,
      @JsonKey(name: 'challenge_enddate') this.challengeEndDate,
      @JsonKey(name: 'total_day') this.totalDay,
      @JsonKey(name: 'is_set_reminder') this.isSetReminder,
      @JsonKey(name: 'is_challenge_complete') this.isChallengeComplete,
      @JsonKey(name: 'current_day') this.currentDay,
      @JsonKey(name: 'is_today_challenge_complete')
      this.isTodayChallengeComplete,
      @JsonKey(name: 'days_count') this.dayCount,
      @JsonKey(name: 'participate_list')
      final List<ParticipateModel>? participateList,
      @JsonKey(name: 'challenge_task_list')
      final List<ChallengeTaskModel>? challengeTaskList})
      : _participateList = participateList,
        _challengeTaskList = challengeTaskList;

  factory _$ChallengeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeModelImplFromJson(json);

  @override
  @JsonKey(name: 'challenge_id')
  final int? challengeId;
  @override
  @JsonKey(name: 'user_token')
  final String? userToken;
  @override
  @JsonKey(name: 'challenge_name')
  final String? challengeName;
  @override
  @JsonKey(name: 'task_name')
  final String? taskName;
  @override
  @JsonKey(name: 'challenge_startdate')
  final String? challengeStartDate;
  @override
  @JsonKey(name: 'challenge_enddate')
  final String? challengeEndDate;
  @override
  @JsonKey(name: 'total_day')
  final int? totalDay;
  @override
  @JsonKey(name: 'is_set_reminder')
  final int? isSetReminder;
  @override
  @JsonKey(name: 'is_challenge_complete')
  final int? isChallengeComplete;
  @override
  @JsonKey(name: 'current_day')
  final int? currentDay;
  @override
  @JsonKey(name: 'is_today_challenge_complete')
  final int? isTodayChallengeComplete;
  @override
  @JsonKey(name: 'days_count')
  final int? dayCount;
  final List<ParticipateModel>? _participateList;
  @override
  @JsonKey(name: 'participate_list')
  List<ParticipateModel>? get participateList {
    final value = _participateList;
    if (value == null) return null;
    if (_participateList is EqualUnmodifiableListView) return _participateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'ChallengeModel(challengeId: $challengeId, userToken: $userToken, challengeName: $challengeName, taskName: $taskName, challengeStartDate: $challengeStartDate, challengeEndDate: $challengeEndDate, totalDay: $totalDay, isSetReminder: $isSetReminder, isChallengeComplete: $isChallengeComplete, currentDay: $currentDay, isTodayChallengeComplete: $isTodayChallengeComplete, dayCount: $dayCount, participateList: $participateList, challengeTaskList: $challengeTaskList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeModelImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.challengeName, challengeName) ||
                other.challengeName == challengeName) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.challengeStartDate, challengeStartDate) ||
                other.challengeStartDate == challengeStartDate) &&
            (identical(other.challengeEndDate, challengeEndDate) ||
                other.challengeEndDate == challengeEndDate) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            (identical(other.isSetReminder, isSetReminder) ||
                other.isSetReminder == isSetReminder) &&
            (identical(other.isChallengeComplete, isChallengeComplete) ||
                other.isChallengeComplete == isChallengeComplete) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay) &&
            (identical(
                    other.isTodayChallengeComplete, isTodayChallengeComplete) ||
                other.isTodayChallengeComplete == isTodayChallengeComplete) &&
            (identical(other.dayCount, dayCount) ||
                other.dayCount == dayCount) &&
            const DeepCollectionEquality()
                .equals(other._participateList, _participateList) &&
            const DeepCollectionEquality()
                .equals(other._challengeTaskList, _challengeTaskList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      challengeId,
      userToken,
      challengeName,
      taskName,
      challengeStartDate,
      challengeEndDate,
      totalDay,
      isSetReminder,
      isChallengeComplete,
      currentDay,
      isTodayChallengeComplete,
      dayCount,
      const DeepCollectionEquality().hash(_participateList),
      const DeepCollectionEquality().hash(_challengeTaskList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      __$$ChallengeModelImplCopyWithImpl<_$ChallengeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeModelImplToJson(
      this,
    );
  }
}

abstract class _ChallengeModel implements ChallengeModel {
  const factory _ChallengeModel(
      {@JsonKey(name: 'challenge_id') final int? challengeId,
      @JsonKey(name: 'user_token') final String? userToken,
      @JsonKey(name: 'challenge_name') final String? challengeName,
      @JsonKey(name: 'task_name') final String? taskName,
      @JsonKey(name: 'challenge_startdate') final String? challengeStartDate,
      @JsonKey(name: 'challenge_enddate') final String? challengeEndDate,
      @JsonKey(name: 'total_day') final int? totalDay,
      @JsonKey(name: 'is_set_reminder') final int? isSetReminder,
      @JsonKey(name: 'is_challenge_complete') final int? isChallengeComplete,
      @JsonKey(name: 'current_day') final int? currentDay,
      @JsonKey(name: 'is_today_challenge_complete')
      final int? isTodayChallengeComplete,
      @JsonKey(name: 'days_count') final int? dayCount,
      @JsonKey(name: 'participate_list')
      final List<ParticipateModel>? participateList,
      @JsonKey(name: 'challenge_task_list')
      final List<ChallengeTaskModel>?
          challengeTaskList}) = _$ChallengeModelImpl;

  factory _ChallengeModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeModelImpl.fromJson;

  @override
  @JsonKey(name: 'challenge_id')
  int? get challengeId;
  @override
  @JsonKey(name: 'user_token')
  String? get userToken;
  @override
  @JsonKey(name: 'challenge_name')
  String? get challengeName;
  @override
  @JsonKey(name: 'task_name')
  String? get taskName;
  @override
  @JsonKey(name: 'challenge_startdate')
  String? get challengeStartDate;
  @override
  @JsonKey(name: 'challenge_enddate')
  String? get challengeEndDate;
  @override
  @JsonKey(name: 'total_day')
  int? get totalDay;
  @override
  @JsonKey(name: 'is_set_reminder')
  int? get isSetReminder;
  @override
  @JsonKey(name: 'is_challenge_complete')
  int? get isChallengeComplete;
  @override
  @JsonKey(name: 'current_day')
  int? get currentDay;
  @override
  @JsonKey(name: 'is_today_challenge_complete')
  int? get isTodayChallengeComplete;
  @override
  @JsonKey(name: 'days_count')
  int? get dayCount;
  @override
  @JsonKey(name: 'participate_list')
  List<ParticipateModel>? get participateList;
  @override
  @JsonKey(name: 'challenge_task_list')
  List<ChallengeTaskModel>? get challengeTaskList;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
