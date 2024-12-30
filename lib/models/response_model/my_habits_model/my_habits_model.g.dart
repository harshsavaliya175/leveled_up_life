// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_habits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyHabitsModelImpl _$$MyHabitsModelImplFromJson(Map<String, dynamic> json) =>
    _$MyHabitsModelImpl(
      habitId: (json['habit_id'] as num?)?.toInt(),
      userToken: json['user_token'] as String?,
      habitName: json['habit_name'] as String?,
      habitTime: json['habit_time'] as String?,
      isSetReminder: (json['is_set_reminder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MyHabitsModelImplToJson(_$MyHabitsModelImpl instance) =>
    <String, dynamic>{
      'habit_id': instance.habitId,
      'user_token': instance.userToken,
      'habit_name': instance.habitName,
      'habit_time': instance.habitTime,
      'is_set_reminder': instance.isSetReminder,
    };
