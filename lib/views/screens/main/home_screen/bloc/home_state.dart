part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String message,
    @Default(0) double rating,
    @Default(0) int dayIndex,
    @Default(0) int friends,
    @Default(0) int thirtyDayChallengeDay,
    @Default(0) int badge,
    @Default(false) bool isForceLogout,
    BibleVerseModel? homeDisplayBibleVerse,
    BibleVerseModel? thirtyDaysBibleVerse,
  }) = _HomeState;
}
