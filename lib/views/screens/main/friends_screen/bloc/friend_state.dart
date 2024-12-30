part of 'friend_cubit.dart';

@freezed
class FriendState with _$FriendState {
  const factory FriendState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<FriendModel?> friendModelList,
  }) = _FriendState;
}
