import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences get instance => si.get<SharedPreferences>();

  static const String userInfo = "userInfo";
  static const String userEmail = "user_email";
  static const String userName = "user_name";
  static const String userProfileImage = "user_profile_image";
  static const String userToken = "user_token";
  static const String isLogIn = "isLogIn";
  static const String appDeviceType = "App-Device-Type";
  static const String appStoreVersion = "App-Store-Version";
  static const String appDeviceModel = "App-Device-Model";
  static const String appOsVersion = "App-Os-Version";
  static const String appStoreBuildNumber = "App-Store-Build-Number";
  static const String authToken = "Auth-Token";
  static const String deviceToken = "Device-Token";
  static const String challengeId = "Challenge-Id";
  static const String oppositeUserToken = "Opposite-User-Token";

  void saveUserItem(UserModel userItem) {
    putBool(isLogIn, true);
    putString(userEmail, userItem.email);
    putString(userName, userItem.userName);
    putString(userProfileImage, userItem.userProfilePhoto);
    putString(authToken, userItem.authToken);
    putString(userToken, userItem.userToken);
    putString(deviceToken, userItem.devicePushToken);
    putString(userInfo, jsonEncode(userItem.toJson()));
  }

  void clearUserInfo() async {
    await instance.clear();
    putAppDeviceInfo();
  }

  saveUserModel(var userItem) {
    instance.setString(userInfo, jsonEncode(userItem));
  }

  UserModel? getUserModel() {
    String encodedModel = instance.getString(userInfo) ?? "";
    if (encodedModel.isEmpty) {
      return null;
    } else {
      Map<String, dynamic> model = jsonDecode(encodedModel);
      return UserModel.fromJson(model);
    }
  }

  Future<void> putAppDeviceInfo() async {
    bool isiOS = Platform.isIOS;
    putString(appDeviceType, isiOS ? "iOS" : "android");
    var deviceInfo = await appDeviceInfo();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (isiOS) {
      IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
      putString(appDeviceModel, deviceInfo.name);
      putString(appOsVersion, "iOS ${iosDeviceInfo.systemVersion}");
    } else {
      AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
      putString(appDeviceModel, androidDeviceInfo.model);
      putString(appOsVersion, androidDeviceInfo.version.release);
    }
    putString(appStoreVersion, packageInfo.version);
    putString(appStoreBuildNumber, packageInfo.buildNumber);
  }

  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }

  Future<bool?> putString(String key, String value) async {
    return instance.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    return instance.getString(key) ?? defValue;
  }

  Future<bool?> putList(String key, List<String> value) async {
    return instance.setStringList(key, value);
  }

  List<String>? getList(String key, {List<String> defValue = const []}) {
    return instance.getStringList(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return instance.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return instance.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    return instance.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return instance.getDouble(key) ?? defValue;
  }

  bool? getBool(String key, {bool defValue = false}) {
    return instance.getBool(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return instance.setBool(key, value);
  }
}
