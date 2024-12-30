part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    ResponseItem? responseItem,
    @Default('') String message,
  }) = _ForgotPasswordState;
}
