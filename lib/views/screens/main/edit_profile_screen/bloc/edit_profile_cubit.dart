import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AuthRepo _authRepo;

  EditProfileCubit(this._authRepo) : super(const EditProfileState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const EditProfileState());
  }

  void fillEditProfileData() {
    String? user = preferences.getString(SharedPreference.userInfo);
    if (user != null && user != '') {
      UserModel userModel = UserModel.fromJson(jsonDecode(user));
      emit(
        state.copyWith(
          name: userModel.userName,
          email: userModel.email,
          profilePictureImg: profileImagePath + userModel.userProfilePhoto,
          file: null,
        ),
      );
    }
  }

  void changeData({
    File? file,
    String? name,
  }) {
    emit(
      state.copyWith(
        file: file ?? state.file,
        name: name ?? state.name,
        responseItem: null,
        message: '',
      ),
    );
  }

  Future<void> editProfileButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (editProfileValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _authRepo.editProfile(
          userName: state.name,
          profileImage: state.file,
        );
        if (data.status) {
          UserModel userModel = UserModel.fromJson(data.data);
          preferences.saveUserItem(userModel);
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

  bool editProfileValidation() {
    if (state.name.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_name.tr()));
      return false;
    }
    return true;
  }
}
