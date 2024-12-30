// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeModelImpl _$$ChallengeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeModelImpl(
      challengeId: (json['challenge_id'] as num?)?.toInt(),
      userToken: json['user_token'] as String?,
      challengeName: json['challenge_name'] as String?,
      taskName: json['task_name'] as String?,
      challengeStartDate: json['challenge_startdate'] as String?,
      challengeEndDate: json['challenge_enddate'] as String?,
      totalDay: (json['total_day'] as num?)?.toInt(),
      isSetReminder: (json['is_set_reminder'] as num?)?.toInt(),
      isChallengeComplete: (json['is_challenge_complete'] as num?)?.toInt(),
      currentDay: (json['current_day'] as num?)?.toInt(),
      isTodayChallengeComplete:
          (json['is_today_challenge_complete'] as num?)?.toInt(),
      dayCount: (json['days_count'] as num?)?.toInt(),
      participateList: (json['participate_list'] as List<dynamic>?)
          ?.map((e) => ParticipateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      challengeTaskList: (json['challenge_task_list'] as List<dynamic>?)
          ?.map((e) => ChallengeTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChallengeModelImplToJson(
        _$ChallengeModelImpl instance) =>
    <String, dynamic>{
      'challenge_id': instance.challengeId,
      'user_token': instance.userToken,
      'challenge_name': instance.challengeName,
      'task_name': instance.taskName,
      'challenge_startdate': instance.challengeStartDate,
      'challenge_enddate': instance.challengeEndDate,
      'total_day': instance.totalDay,
      'is_set_reminder': instance.isSetReminder,
      'is_challenge_complete': instance.isChallengeComplete,
      'current_day': instance.currentDay,
      'is_today_challenge_complete': instance.isTodayChallengeComplete,
      'days_count': instance.dayCount,
      'participate_list': instance.participateList,
      'challenge_task_list': instance.challengeTaskList,
    };
