part of 'thirty_days_challenges_cubit.dart';

@freezed
class ThirtyDaysChallengesState with _$ThirtyDaysChallengesState {
  const factory ThirtyDaysChallengesState({
    @Default(0) int dayIndex,
    int? selectedIndex,
    @Default(0) int chartSelectedIndex,
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(false) bool isForceLogout,
    ThirtyDaysDataModel? thirtyDaysDataModel,
    SummaryChartModel? summaryChartModel,
  }) = _ThirtyDaysChallengesState;
}
