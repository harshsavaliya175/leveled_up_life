part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool passwordVisibility,
    @Default(false) bool confirmPasswordVisibility,
  }) = _SignUpState;
}
