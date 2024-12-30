part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    ResponseItem? responseItem,
    @Default('') String message,
    @Default('') String oldPassword,
    @Default('') String newPassword,
    @Default('') String confirmPassword,
    @Default(false) bool oldPasswordVisibility,
    @Default(false) bool newPasswordVisibility,
    @Default(false) bool confirmPasswordVisibility,
    @Default(false) bool isForceLogout,
  }) = _ChangePasswordState;
}
