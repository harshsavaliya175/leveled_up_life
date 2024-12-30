import 'package:codonnier_network/network/api_type.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/service_injector.dart';

class ApiEndPoint {
  static const String updateDeviceToken = "updateDeviceToken";
  static const String login = "login";
  static const String deleteAccount = "deleteAccount";
  static const String registration = "registration";
  static const String forgotPassword = "forgotPassword";
  static const String changePasswordWithVerifyCode =
      "changePasswordWithVerifyCode";
  static const String changePassword = "changePassword";
  static const String editProfile = "editProfile";
  static const String getUserDetailsFromId = "getUserDetailsFromId";
  static const String updateNotificationSetting = "updateNotificationSetting";
  static const String getGratefulList = "getGratefulList";
  static const String getAffirmationList = "getAffirmationList";
  static const String addGrateful = "addGrateful";
  static const String editGrateful = "editGrateful";
  static const String addAffirmation = "addAffirmation";
  static const String getHabitList = "getHabitList";
  static const String editHabits = "editHabits";
  static const String deleteHabits = "deleteHabits";
  static const String getFriendsList = "getFriendsList";
  static const String acceptRejectRequest = "acceptRejectRequest";
  static const String getFriendRequestCount = "getFriendRequestCount";
  static const String searchFriends = "searchFriends";
  static const String sendRequest = "sendRequest";
  static const String getFriendProfileDetails = "getFriendProfileDetails";
  static const String getChallengeList = "getChallengeList";
  static const String getChallengeRequestCount = "getChallengeRequestCount";
  static const String getChallengeRequestList = "getChallengeRequestList";
  static const String acceptRejectChallengeRequest =
      "acceptRejectChallengeRequest";
  static const String completeChallenge = "completeChallenge";
  static const String addChallenge = "addChallenge";
  static const String getDailyChallengeList = "getDailyChallengeList";
  static const String completeDailyChallenge = "completeDailyChallenge";
  static const String getSummaryChart = "getSummaryChart";
  static const String getBibleVerse = "getBibleVerse";
  static const String checkChallenge = "checkChallenge";
  static const String checkBibleVerseChallenge = "checkBibleVerseChallenge";
  static const String addShareBibleVerseText = "addShareBibleVerseText";
  static const String logout = "logout";
  static const String getNotificationsList = "getNotificationsList";
  static const String sendRequestBranchIO = "sendRequestBranchIO";

  /// Subscription API
  static const String verifyReceipt = "verifyReceipt";
  static const String googleCloudGetStatus = "googleCloudGetStatus";
  static const String getReceiptStatus = "getReceiptStatus";
}

Map<String, String> requestHeader(APIType apiType) {
  SharedPreference preferences = si.get<SharedPreference>();
  return {
    RequestHeaderKey.contentType: "application/json",
    RequestHeaderKey.appSecret: "LEVELEDUPLIFE@NV7803#",
    RequestHeaderKey.appTrackVersion: "v1",
    RequestHeaderKey.appDeviceType:
        preferences.getString(SharedPreference.appDeviceType) ?? '',
    RequestHeaderKey.appStoreVersion:
        preferences.getString(SharedPreference.appStoreVersion) ?? '',
    RequestHeaderKey.appDeviceModel:
        preferences.getString(SharedPreference.appDeviceModel) ?? '',
    RequestHeaderKey.appOsVersion:
        preferences.getString(SharedPreference.appOsVersion) ?? '',
    RequestHeaderKey.appStoreBuildNumber:
        preferences.getString(SharedPreference.appStoreBuildNumber) ?? '',
    if (apiType == APIType.protected)
      RequestHeaderKey.authToken:
          preferences.getString(SharedPreference.authToken) ?? '',
  };
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
}

class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
}
