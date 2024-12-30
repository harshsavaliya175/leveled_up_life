part of 'challenge_request_cubit.dart';

@freezed
class ChallengeRequestState with _$ChallengeRequestState {
  const factory ChallengeRequestState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<ChallengeRequestModel?> challengeRequestModelList,
    @Default(false) bool isForceLogout,
  }) = _ChallengeRequestState;
}
