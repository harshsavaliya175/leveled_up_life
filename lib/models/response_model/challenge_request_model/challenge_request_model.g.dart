// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeRequestModelImpl _$$ChallengeRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeRequestModelImpl(
      challengeFriendId: (json['challenge_friend_id'] as num?)?.toInt() ?? 0,
      challengeName: json['challenge_name'] as String? ?? '',
      totalDay: (json['total_day'] as num?)?.toInt() ?? 0,
      challengeTaskList: (json['challenge_task_list'] as List<dynamic>?)
          ?.map((e) => ChallengeTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChallengeRequestModelImplToJson(
        _$ChallengeRequestModelImpl instance) =>
    <String, dynamic>{
      'challenge_friend_id': instance.challengeFriendId,
      'challenge_name': instance.challengeName,
      'total_day': instance.totalDay,
      'challenge_task_list': instance.challengeTaskList,
    };
