import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_habits_model.freezed.dart';
part 'my_habits_model.g.dart';

@freezed
class MyHabitsModel with _$MyHabitsModel {
  const factory MyHabitsModel({
    @JsonKey(name: 'habit_id') int? habitId,
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'habit_name') String? habitName,
    @JsonKey(name: 'habit_time') String? habitTime,
    @JsonKey(name: 'is_set_reminder') int? isSetReminder,
  }) = _MyHabitsModel;

  factory MyHabitsModel.fromJson(Map<String, Object?> json) =>
      _$MyHabitsModelFromJson(json);
}
