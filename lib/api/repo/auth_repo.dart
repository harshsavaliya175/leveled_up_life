import 'dart:io';

import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/change_password/change_password_data.dart';
import 'package:leveled_up_life/models/request_model/forgot_password/forgot_password_data.dart';
import 'package:leveled_up_life/models/request_model/reset_password/reset_password_data.dart';
import 'package:leveled_up_life/models/request_model/set_notification_setting/set_notification_setting_data.dart';
import 'package:leveled_up_life/models/request_model/sign_in/sign_in_data.dart';
import 'package:leveled_up_life/models/request_model/sign_up/sign_up_data.dart';

class AuthRepo {
  Future<ResponseItem> userSignIn(SignInData signInData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.public,
        signInData.toJson(),
        headers: requestHeader(APIType.public),
        query: {
          RequestParam.service: ApiEndPoint.login,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> userSignUp(SignUpData signUpData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.public,
        signUpData.toJson(),
        headers: requestHeader(APIType.public),
        query: {
          RequestParam.service: ApiEndPoint.registration,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> forgotPassword(
      ForgotPasswordData forgotPasswordData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.public,
        forgotPasswordData.toJson(),
        headers: requestHeader(APIType.public),
        query: {
          RequestParam.service: ApiEndPoint.forgotPassword,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> resetPassword(
      ResetPasswordData resetPasswordData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.public,
        resetPasswordData.toJson(),
        headers: requestHeader(APIType.public),
        query: {
          RequestParam.service: ApiEndPoint.changePasswordWithVerifyCode,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> changePassword(
      ChangePasswordData changePasswordData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        changePasswordData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.changePassword,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> editProfile({
    required String userName,
    File? profileImage,
  }) async {
    try {
      Response response = await RestClient.instance.postFormData(
        APIType.protected,
        {
          'user_name': userName,
          if (profileImage != null)
            'profile_images': await MultipartFile.fromFile(profileImage.path,
                filename: profileImage.path.split('/').last)
        },
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.editProfile,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> getNotificationData() async {
    try {
      Response response = await RestClient.instance.get(
        APIType.protected,
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getUserDetailsFromId,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> setNotification(
      SetNotificationSettingData setNotificationSettingData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        setNotificationSettingData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.updateNotificationSetting,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  String getCurrentTimeZone() {
    final duration = DateTime.now().timeZoneOffset,
        hours = duration.inHours,
        minutes = duration.inMinutes.remainder(60).abs().toInt();

    return '${hours > 0 ? '+' : '-'}${twoDigits(hours.abs())}:${twoDigits(minutes)}';
  }

  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  Future<ResponseItem> updateDeviceToken({String devicePushToken = ''}) async {
    try {
      String timezone = getCurrentTimeZone();
      Response response = await RestClient.instance.post(
        APIType.protected,
        {
          "device_push_token": devicePushToken,
          "time_zone": timezone,
        },
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.updateDeviceToken},
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> logoutUser() async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.logout},
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> deleteAccount() async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.deleteAccount},
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }
}
