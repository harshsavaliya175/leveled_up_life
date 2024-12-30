part of 'create_new_challenge_cubit.dart';

@freezed
class CreateNewChallengeState with _$CreateNewChallengeState {
  const factory CreateNewChallengeState({
    @Default('') String message,
    @Default(false) bool isReminderStart,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String challengeName,
    @Default('') String taskName,
    @Default(1) int taskCount,
    @Default(['']) List<String> taskList,
    @Default([]) List<TextEditingController> taskControllerList,
  }) = _CreateNewChallengeState;
}
