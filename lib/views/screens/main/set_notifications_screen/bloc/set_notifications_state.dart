part of 'set_notifications_cubit.dart';

@freezed
class SetNotificationsState with _$SetNotificationsState {
  const factory SetNotificationsState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(false) bool isMotivationsQuotes,
    @Default(false) bool isAffirmation,
    @Default(false) bool isForceLogout,
    @Default('') String motivationsQuotesTime,
    @Default('') String affirmationTime,
  }) = _SetNotificationsState;
}
