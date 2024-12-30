part of 'my_habit_cubit.dart';

@freezed
class MyHabitState with _$MyHabitState {
  const factory MyHabitState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String habits,
    @Default('') String time,
    @Default(false) bool isSetReminder,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<MyHabitsModel?> myHabitsModelList,
    @Default(false) bool isForceLogout,
  }) = _MyHabitState;
}
