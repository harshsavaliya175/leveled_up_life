part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String verificationCode,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool passwordVisibility,
    @Default(false) bool confirmPasswordVisibility,
  }) = _ResetPasswordState;
}
