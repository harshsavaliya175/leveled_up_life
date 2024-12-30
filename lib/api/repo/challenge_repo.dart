import 'package:codonnier_network/network/api_type.dart';
import 'package:codonnier_network/network/rest_client.dart';
import 'package:codonnier_network/utils/failure.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/cteate_challenge/create_challenge_data.dart';
import 'package:leveled_up_life/models/request_model/get_challenges/get_challenges_data.dart';
import 'package:leveled_up_life/service_injector.dart';

class ChallengeRepo {
  SharedPreference preference = si.get<SharedPreference>();

  Future<ResponseItem> getChallengeList(
      GetChallengesData getChallengesData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        getChallengesData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getChallengeList,
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

  Future<ResponseItem> getChallengeRequestCount() async {
    try {
      Response response = await RestClient.instance.get(
        APIType.protected,
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getChallengeRequestCount,
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

  Future<ResponseItem> getChallengeRequestList(int page) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {
          "page": page,
          "limit": limit,
        },
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getChallengeRequestList,
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

  Future<ResponseItem> acceptAndRejectChallengeRequest({
    required String type,
    required int challengeFriendId,
  }) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {
          'type': type,
          'challenge_friend_id': challengeFriendId,
        },
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.acceptRejectChallengeRequest},
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

  Future<ResponseItem> challengeComplete({
    required int challengeId,
    required int challengeTaskId,
  }) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {
          'challenge_id': challengeId,
          'challenge_task_id': challengeTaskId,
        },
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.completeChallenge},
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

  Future<ResponseItem> createChallenge(
      CreateChallengeData createChallengeData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        createChallengeData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.addChallenge},
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

  Future<ResponseItem> sendRequestBranchIO(
      String challengeId, String userToken) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {
          "opp_user_token": userToken,
          "challenge_id": challengeId,
        },
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.sendRequestBranchIO},
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

  Future<ResponseItem> getThirtyDaysChallenge(String type) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"type": type},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getDailyChallengeList},
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

  Future<ResponseItem> completeDailyChallenge(int daysChallengeId) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"days_challenge_id": daysChallengeId},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.completeDailyChallenge},
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

  Future<ResponseItem> getSummaryChart(String type) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"type": type},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getSummaryChart},
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

  Future<ResponseItem> getBibleVerse(bool isForBible) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"is_for_bible": isForBible},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getBibleVerse},
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

  Future<ResponseItem> checkChallenge(bool isForgotOrFail) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"is_forgot_or_fail": isForgotOrFail ? 1 : 0},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.checkChallenge},
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

  Future<ResponseItem> checkBibleVerseChallenge(bool isForgotOrFail) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"is_forgot_or_fail": isForgotOrFail ? 1 : 0},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.checkBibleVerseChallenge},
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

  Future<ResponseItem> addShareBibleVerseText(String bibleVerseText) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"bible_verse_text": bibleVerseText},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.addShareBibleVerseText},
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
