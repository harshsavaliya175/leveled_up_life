// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeTaskModelImpl _$$ChallengeTaskModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeTaskModelImpl(
      challengeTaskId: (json['challenge_task_id'] as num?)?.toInt(),
      challengeId: (json['challenge_id'] as num?)?.toInt(),
      challengeTaskName: json['challenge_task_name'] as String?,
      isComplete: (json['is_complete'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChallengeTaskModelImplToJson(
        _$ChallengeTaskModelImpl instance) =>
    <String, dynamic>{
      'challenge_task_id': instance.challengeTaskId,
      'challenge_id': instance.challengeId,
      'challenge_task_name': instance.challengeTaskName,
      'is_complete': instance.isComplete,
    };
