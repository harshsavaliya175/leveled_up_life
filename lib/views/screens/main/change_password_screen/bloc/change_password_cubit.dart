import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/change_password/change_password_data.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepo _authRepo;

  ChangePasswordCubit(this._authRepo) : super(const ChangePasswordState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const ChangePasswordState());
  }

  void changeData({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
    bool? oldPasswordVisibility,
    bool? newPasswordVisibility,
    bool? confirmPasswordVisibility,
  }) {
    emit(
      state.copyWith(
        oldPassword: oldPassword ?? state.oldPassword,
        newPassword: newPassword ?? state.newPassword,
        confirmPassword: confirmPassword ?? state.confirmPassword,
        oldPasswordVisibility:
            oldPasswordVisibility ?? state.oldPasswordVisibility,
        newPasswordVisibility:
            newPasswordVisibility ?? state.newPasswordVisibility,
        confirmPasswordVisibility:
            confirmPasswordVisibility ?? state.confirmPasswordVisibility,
        message: '',
        responseItem: null,
      ),
    );
  }

  Future<void> changePasswordButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (changePasswordValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _authRepo.changePassword(
          ChangePasswordData(
            state.oldPassword,
            state.newPassword,
          ),
        );
        if (data.status) {
          preferences.clearUserInfo();
          preferences.putString(SharedPreference.authToken, data.newToken!);
          emit(state.copyWith(
            oldPassword: '',
            newPassword: '',
            confirmPassword: '',
          ));
          emit(state.copyWith(
            responseItem: data,
            message: data.message,
          ));
        } else {
          if (data.forceLogout) {
            emit(state.copyWith(
              message: data.message,
              responseItem: null,
              isForceLogout: data.forceLogout,
            ));
          }
        }
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  bool changePasswordValidation() {
    if (state.oldPassword.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_old_password.tr()));
      return false;
    } else if (state.newPassword.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_new_password.tr()));
      return false;
    } else if (state.confirmPassword.isEmpty) {
      emit(state.copyWith(
          message: LocaleKeys.please_enter_confirm_password.tr()));
      return false;
    } else if (state.newPassword != state.confirmPassword) {
      emit(state.copyWith(message: LocaleKeys.password_does_not_match.tr()));
      return false;
    }
    return true;
  }
}
