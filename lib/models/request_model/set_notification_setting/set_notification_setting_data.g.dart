// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_notification_setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetNotificationSettingData _$SetNotificationSettingDataFromJson(
        Map<String, dynamic> json) =>
    SetNotificationSettingData(
      (json['is_motivations_notification'] as num).toInt(),
      json['motivations_notification_time'] as String,
      (json['is_affirmation_notification'] as num).toInt(),
      json['affirmation_notification_time'] as String,
    );

Map<String, dynamic> _$SetNotificationSettingDataToJson(
        SetNotificationSettingData instance) =>
    <String, dynamic>{
      'is_motivations_notification': instance.isMotivationsNotification,
      'motivations_notification_time': instance.motivationsNotificationTime,
      'is_affirmation_notification': instance.isAffirmationNotification,
      'affirmation_notification_time': instance.affirmationNotificationTime,
    };
