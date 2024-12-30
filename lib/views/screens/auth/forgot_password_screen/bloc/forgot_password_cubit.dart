import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/forgot_password/forgot_password_data.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo _authRepo;

  ForgotPasswordCubit(this._authRepo) : super(const ForgotPasswordState());

  void initData() {
    emit(const ForgotPasswordState());
  }

  Future<void> requestButton(String email) async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (forgotPasswordValidation(email)) {
      EasyLoading.show();
      try {
        ResponseItem data =
            await _authRepo.forgotPassword(ForgotPasswordData(email));
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

  bool forgotPasswordValidation(String email) {
    if (email.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_email.tr()));
      return false;
    } else if (!email.isEmailValid) {
      emit(state.copyWith(message: LocaleKeys.please_enter_valid_email.tr()));
      return false;
    }
    return true;
  }
}
