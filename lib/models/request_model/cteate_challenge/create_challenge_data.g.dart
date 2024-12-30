// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_challenge_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChallengeData _$CreateChallengeDataFromJson(Map<String, dynamic> json) =>
    CreateChallengeData(
      challengeName: json['challenge_name'] as String,
      taskName: json['task_name'] as List<dynamic>,
      challengeStartDate: json['challenge_startdate'] as String,
      challengeEndDate: json['challenge_enddate'] as String,
      isSetReminder: (json['is_set_reminder'] as num).toInt(),
      userTokens: json['user_tokens'] as List<dynamic>,
    );

Map<String, dynamic> _$CreateChallengeDataToJson(
        CreateChallengeData instance) =>
    <String, dynamic>{
      'challenge_name': instance.challengeName,
      'task_name': instance.taskName,
      'challenge_startdate': instance.challengeStartDate,
      'challenge_enddate': instance.challengeEndDate,
      'is_set_reminder': instance.isSetReminder,
      'user_tokens': instance.userTokens,
    };
