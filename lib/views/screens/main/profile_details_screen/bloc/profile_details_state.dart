part of 'profile_details_cubit.dart';

@freezed
class ProfileDetailsState with _$ProfileDetailsState {
  const factory ProfileDetailsState({
    ResponseItem? responseItem,
    @Default('') String message,
    FriendProfileDetailsModel? profileModel,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<ChallengeModel?> challengeModelList,
  }) = _ProfileDetailsState;
}
