// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_habit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditHabitData _$AddEditHabitDataFromJson(Map<String, dynamic> json) =>
    AddEditHabitData(
      type: json['type'] as String? ?? 'ADD',
      habitId: (json['habit_id'] as num?)?.toInt(),
      habitName: json['habit_name'] as String? ?? '',
      habitTime: json['habit_time'] as String? ?? '',
      isSetReminder: (json['is_set_reminder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AddEditHabitDataToJson(AddEditHabitData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'habit_id': instance.habitId,
      'habit_name': instance.habitName,
      'habit_time': instance.habitTime,
      'is_set_reminder': instance.isSetReminder,
    };
