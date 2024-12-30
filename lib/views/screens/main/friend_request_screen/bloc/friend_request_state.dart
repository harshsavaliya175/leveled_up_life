part of 'friend_request_cubit.dart';

@freezed
class FriendRequestState with _$FriendRequestState {
  const factory FriendRequestState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default(false) bool isForceLogout,
    @Default([]) List<FriendModel?> friendRequestModelList,
  }) = _FriendRequestState;
}
