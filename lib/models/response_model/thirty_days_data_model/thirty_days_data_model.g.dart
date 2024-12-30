// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thirty_days_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThirtyDaysDataModelImpl _$$ThirtyDaysDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThirtyDaysDataModelImpl(
      days: (json['days'] as num?)?.toInt() ?? 1,
      challengeList: (json['challenge_list'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ThirtyDaysChallengeModel.fromJson(
                      e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ThirtyDaysDataModelImplToJson(
        _$ThirtyDaysDataModelImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'challenge_list': instance.challengeList,
    };
