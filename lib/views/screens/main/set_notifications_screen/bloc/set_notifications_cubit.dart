import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/set_notification_setting/set_notification_setting_data.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'set_notifications_cubit.freezed.dart';
part 'set_notifications_state.dart';

class SetNotificationsCubit extends Cubit<SetNotificationsState> {
  final AuthRepo _authRepo;

  SetNotificationsCubit(this._authRepo) : super(const SetNotificationsState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const SetNotificationsState());
  }

  void changeData({
    bool? isMotivationsQuotes,
    bool? isAffirmation,
    String? affirmationTime,
    String? motivationsQuotesTime,
  }) {
    emit(
      state.copyWith(
        message: '',
        responseItem: null,
        isMotivationsQuotes: isMotivationsQuotes ?? state.isMotivationsQuotes,
        isAffirmation: isAffirmation ?? state.isAffirmation,
        affirmationTime: affirmationTime ?? state.affirmationTime,
        motivationsQuotesTime:
            motivationsQuotesTime ?? state.motivationsQuotesTime,
      ),
    );
  }

  Future<void> getNotificationsData() async {
    emit(state.copyWith(message: '', responseItem: null));
    try {
      ResponseItem data = await _authRepo.getNotificationData();
      bool isAffirmation = false;
      bool isMotivationsQuotes = false;
      String affirmationTime = '';
      String motivationsQuotesTime = '';
      if (data.status) {
        UserModel userModel = UserModel.fromJson(data.data);
        isAffirmation = userModel.isAffirmationNotification == 1;
        isMotivationsQuotes = userModel.isMotivationsNotification == 1;
        affirmationTime = userModel.affirmationNotificationTime;
        motivationsQuotesTime = userModel.motivationsNotificationTime;
      }
      emit(
        state.copyWith(
          isAffirmation: isAffirmation,
          isMotivationsQuotes: isMotivationsQuotes,
          affirmationTime: affirmationTime,
          motivationsQuotesTime: motivationsQuotesTime,
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  Future<bool> setNotificationsButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    bool isSetNotification = false;
    // if (setNotificationValidation(isMotivation)) {
    EasyLoading.show();
    try {
      ResponseItem data = await _authRepo.setNotification(
        SetNotificationSettingData(
          state.isMotivationsQuotes ? 1 : 0,
          state.motivationsQuotesTime.isEmpty
              ? '${DateTime.now().hour}:${DateTime.now().minute}'
              : state.motivationsQuotesTime,
          state.isAffirmation ? 1 : 0,
          state.affirmationTime.isEmpty
              ? '${DateTime.now().hour}:${DateTime.now().minute}'
              : state.affirmationTime,
        ),
      );
      if (data.status) {
        isSetNotification = true;
        UserModel userModel = UserModel.fromJson(data.data);
        preferences.saveUserItem(userModel);
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
        ));
      } else {
        emit(state.copyWith(
          message: data.message,
          responseItem: null,
          isForceLogout: data.forceLogout,
        ));
      }
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    // }
    return isSetNotification;
  }

// bool setNotificationValidation(bool isMotivation) {
//   if (isMotivation) {
//     if (state.motivationsQuotesTime.isEmpty) {
//       emit(state.copyWith(message: LocaleKeys.please_select_time.tr()));
//       return false;
//     }
//   } else {
//     if (state.affirmationTime.isEmpty) {
//       emit(state.copyWith(message: LocaleKeys.please_select_time.tr()));
//       return false;
//     }
//   }
//   return true;
// }
}
