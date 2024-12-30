import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_habit_data.g.dart';

@JsonSerializable()
class AddEditHabitData {
  String type;
  @JsonKey(name: 'habit_id')
  int? habitId;

  @JsonKey(name: 'habit_name')
  String habitName;
  @JsonKey(name: 'habit_time')
  String habitTime;
  @JsonKey(name: 'is_set_reminder')
  int isSetReminder;

  AddEditHabitData({
    this.type = 'ADD',
    this.habitId,
    this.habitName = '',
    this.habitTime = '',
    this.isSetReminder = 0,
  });

  factory AddEditHabitData.fromJson(Map<String, dynamic> json) =>
      _$AddEditHabitDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddEditHabitDataToJson(this);
}
