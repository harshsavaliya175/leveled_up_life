part of 'challenges_cubit.dart';

@freezed
class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(0) int getChallengeRequestCount,
    @Default(false) bool isPaginationLoader,
    @Default([]) List<ChallengeModel?> challengeModelList,
    @Default(false) bool isForceLogout,
  }) = _ChallengesState;
}
