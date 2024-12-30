part of 'challenge_details_cubit.dart';

@freezed
class ChallengeDetailsState with _$ChallengeDetailsState {
  const factory ChallengeDetailsState({
    ResponseItem? responseItem,
    @Default('') String message,
    ChallengeModel? challengeModel,
    @Default(false) bool isForceLogout,
  }) = _ChallengeDetailsState;
}
