part of 'find_friend_cubit.dart';

@freezed
class FindFriendState with _$FindFriendState {
  const factory FindFriendState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default(0) int getFriendRequestCount,
    @Default('') String searchText,
    @Default([]) List<SearchFriendModel?> searchFriendModelList,
    @Default(false) bool isForceLogout,
  }) = _FindFriendState;
}
