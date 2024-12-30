part of 'affirmation_cubit.dart';

@freezed
class AffirmationState with _$AffirmationState {
  const factory AffirmationState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default(1) int page,
    @Default(false) bool isPaginationLoader,
    @Default('') String date,
    @Default([]) List<AffirmationModel> affirmationModelList,
    @Default('') String addAffirmationText,
    @Default(false) bool isForceLogout,
  }) = _AffirmationState;
}
