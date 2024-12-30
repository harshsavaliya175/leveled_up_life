// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thirty_days_challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThirtyDaysChallengeModelImpl _$$ThirtyDaysChallengeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThirtyDaysChallengeModelImpl(
      daysChallengeId: (json['days_challenge_id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      isComplete: (json['is_complete'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ThirtyDaysChallengeModelImplToJson(
        _$ThirtyDaysChallengeModelImpl instance) =>
    <String, dynamic>{
      'days_challenge_id': instance.daysChallengeId,
      'title': instance.title,
      'type': instance.type,
      'is_complete': instance.isComplete,
    };
