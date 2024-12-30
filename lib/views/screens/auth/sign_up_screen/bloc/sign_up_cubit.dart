import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/sign_up/sign_up_data.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;

  SignUpCubit(this._authRepo) : super(const SignUpState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const SignUpState());
  }

  void changeData({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? passwordVisibility,
    bool? confirmPasswordVisibility,
  }) {
    emit(
      state.copyWith(
        name: name ?? state.name,
        email: email ?? state.email,
        password: password ?? state.password,
        confirmPassword: confirmPassword ?? state.confirmPassword,
        passwordVisibility: passwordVisibility ?? state.passwordVisibility,
        confirmPasswordVisibility:
            confirmPasswordVisibility ?? state.confirmPasswordVisibility,
        message: '',
      ),
    );
  }

  Future<void> signUpButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (signUpValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _authRepo.userSignUp(
          SignUpData(
            state.name,
            state.email,
            state.password,
          ),
        );
        if (data.status) {
          UserModel userModel = UserModel.fromJson(data.data);
          preferences.saveUserItem(userModel);
        }
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
        ));
        // EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  bool signUpValidation() {
    if (state.name.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_name.tr()));
      return false;
    } else if (state.email.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_email.tr()));
      return false;
    } else if (!state.email.isEmailValid) {
      emit(state.copyWith(message: LocaleKeys.please_enter_valid_email.tr()));
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
