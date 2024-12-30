import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/sign_in/sign_in_data.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;

  SignInCubit(this._authRepo) : super(const SignInState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const SignInState());
  }

  void changeData({
    String? email,
    String? password,
    bool? passwordVisibility,
  }) {
    emit(state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
      passwordVisibility: passwordVisibility ?? state.passwordVisibility,
      message: '',
    ));
  }

  Future<void> signInButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (signInValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _authRepo.userSignIn(
          SignInData(state.email, state.password),
        );
        if (data.status) {
          UserModel userModel = UserModel.fromJson(data.data);
          preferences.saveUserItem(userModel);
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

  bool signInValidation() {
    if (state.email.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_email.tr()));
      return false;
    } else if (!state.email.isEmailValid) {
      emit(state.copyWith(message: LocaleKeys.please_enter_valid_email.tr()));
      return false;
    } else if (state.password.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_password.tr()));
      return false;
    }
    return true;
  }
}
