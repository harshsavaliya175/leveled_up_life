part of 'invite_friends_cubit.dart';

@freezed
class InviteFriendsState with _$InviteFriendsState {
  const factory InviteFriendsState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<FriendModel?> friendModelList,
    @Default([]) List tokens,
    @Default(false) bool isReminderStart,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String challengeName,
    @Default([]) List taskList,
  }) = _InviteFriendsState;
}
