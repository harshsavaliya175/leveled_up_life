part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool passwordVisibility,
  }) = _SignInState;
}
