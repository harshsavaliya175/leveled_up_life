import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/reset_password/reset_password_data.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;

  ResetPasswordCubit(this._authRepo) : super(const ResetPasswordState());

  void initData() {
    emit(const ResetPasswordState());
  }

  void changeData({
    String? verificationCode,
    String? password,
    String? confirmPassword,
    bool? passwordVisibility,
    bool? confirmPasswordVisibility,
  }) {
    emit(
      state.copyWith(
        verificationCode: verificationCode ?? state.verificationCode,
        password: password ?? state.password,
        confirmPassword: confirmPassword ?? state.confirmPassword,
        passwordVisibility: passwordVisibility ?? state.passwordVisibility,
        confirmPasswordVisibility:
            confirmPasswordVisibility ?? state.confirmPasswordVisibility,
        message: '',
        responseItem: null,
      ),
    );
  }

  Future<void> resetPasswordRequestButton(String email) async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (verifyValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _authRepo.resetPassword(
          ResetPasswordData(
            email,
            state.verificationCode,
            state.password,
          ),
        );

        if (data.status) {
          emit(state.copyWith(
            password: '',
            confirmPassword: '',
            verificationCode: '',
          ));
        }
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
        ));
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  bool verifyValidation() {
    if (state.verificationCode.isEmpty) {
      emit(state.copyWith(
          message: LocaleKeys.please_enter_verification_code.tr()));
      return false;
    } else if (state.password.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_password.tr()));
      return false;
    } else if (state.confirmPassword.isEmpty) {
      emit(state.copyWith(
          message: LocaleKeys.please_enter_confirm_password.tr()));
      return false;
    } else if (state.password != state.confirmPassword) {
      emit(state.copyWith(message: LocaleKeys.password_does_not_match.tr()));
      return false;
    }
    return true;
  }
}
