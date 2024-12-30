// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      notificationId: (json['notification_id'] as num?)?.toInt() ?? 0,
      senderToken: json['sender_token'] as String? ?? '',
      receiverToken: json['receiver_token'] as String? ?? '',
      type: json['type'] as String? ?? '',
      challengeId: (json['challenge_id'] as num?)?.toInt() ?? 0,
      affirmationId: (json['affirmation_id'] as num?)?.toInt() ?? 0,
      gratefulId: (json['grateful_id'] as num?)?.toInt() ?? 0,
      habitId: (json['habit_id'] as num?)?.toInt() ?? 0,
      daysChallengeId: (json['days_challenge_id'] as num?)?.toInt() ?? 0,
      notificationDate: json['notification_date'] as String? ?? '',
      currentUtcDate: json['current_utc_date'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      challengeFriendId: (json['challenge_friend_id'] as num?)?.toInt() ?? 0,
      affirmationTitle: json['affirmation_title'] as String? ?? '',
      gratefulTitle: json['grateful_title'] as String? ?? '',
      habitName: json['habit_name'] as String? ?? '',
      daysChallengeTitle: json['days_challenge_title'] as String? ?? '',
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'sender_token': instance.senderToken,
      'receiver_token': instance.receiverToken,
      'type': instance.type,
      'challenge_id': instance.challengeId,
      'affirmation_id': instance.affirmationId,
      'grateful_id': instance.gratefulId,
      'habit_id': instance.habitId,
      'days_challenge_id': instance.daysChallengeId,
      'notification_date': instance.notificationDate,
      'current_utc_date': instance.currentUtcDate,
      'user_name': instance.userName,
      'challenge_friend_id': instance.challengeFriendId,
      'affirmation_title': instance.affirmationTitle,
      'grateful_title': instance.gratefulTitle,
      'habit_name': instance.habitName,
      'days_challenge_title': instance.daysChallengeTitle,
    };
