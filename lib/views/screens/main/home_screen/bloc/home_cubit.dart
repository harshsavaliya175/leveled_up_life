import 'dart:developer';

import 'package:codonnier_network/network/api_type.dart';
import 'package:codonnier_network/network/rest_client.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/bible_verse_model/bible_verse_model.dart';
import 'package:leveled_up_life/models/response_model/friend_profile_model/friend_profile_model.dart';
import 'package:leveled_up_life/models/response_model/thirty_days_data_model/thirty_days_data_model.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FriendRepo _friendRepo;
  final ChallengeRepo _challengeRepo;
  final AuthRepo _authRepo;

  HomeCubit(this._friendRepo, this._challengeRepo, this._authRepo)
      : super(const HomeState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const HomeState());
  }

  void changeData({int? dayIndex, int? badge, double? rating}) {
    emit(state.copyWith(
      dayIndex: dayIndex ?? state.dayIndex,
      badge: badge ?? state.badge,
      rating: rating ?? state.rating,
    ));
  }

  Future<void> getFriendsCount() async {
    String? userToken = preferences.getString(SharedPreference.userToken);
    try {
      ResponseItem data =
          await _friendRepo.friendProfileDetails(userToken ?? '');
      FriendProfileDetailsModel? profileModel;
      if (data.status) {
        profileModel = FriendProfileDetailsModel.fromJson(data.data);
        emit(state.copyWith(friends: profileModel.totalFriends ?? 0));
      } else {
        if (data.forceLogout) {
          emit(
            state.copyWith(
              message: data.message,
              isForceLogout: data.forceLogout,
            ),
          );
        }
      }
    } catch (e) {
      log('error -> $e');
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

  Future<void> getChallengeDay() async {
    try {
      String timezone = getCurrentTimeZone();
      await RestClient.instance.post(
        APIType.protected,
        {
          if ((preferences.getString(SharedPreference.deviceToken) ?? "")
              .isNotEmpty)
            "device_push_token":
                preferences.getString(SharedPreference.deviceToken),
          "time_zone": timezone,
        },
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.updateDeviceToken},
      );
      ResponseItem data = await _challengeRepo.getThirtyDaysChallenge(daily);
      if (data.status) {
        ThirtyDaysDataModel? thirtyDaysDataModel =
            ThirtyDaysDataModel.fromJson(data.data);
        emit(state.copyWith(thirtyDayChallengeDay: thirtyDaysDataModel.days));
      } else {
        if (data.forceLogout) {
          emit(state.copyWith(
            message: data.message,
            isForceLogout: data.forceLogout,
          ));
        }
      }
    } catch (e) {
      log('$e');
    }
  }

  Future<void> getBadge() async {
    try {
      ResponseItem data = await _authRepo.getNotificationData();
      if (data.status) {
        UserModel userModel = UserModel.fromJson(data.data);
        preferences.saveUserItem(userModel);
        emit(state.copyWith(badge: userModel.badge));
      }
    } catch (e) {
      log('$e');
    }
  }

  Future<void> sendRequestBranchIO() async {
    emit(state.copyWith(message: ''));
    try {
      String challengeId =
          preferences.getString(SharedPreference.challengeId) ?? "";
      String userToken =
          preferences.getString(SharedPreference.oppositeUserToken) ?? "";

      if (userToken.isNotEmpty) {
        await _challengeRepo.sendRequestBranchIO(challengeId, userToken);
      }
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
    }
  }

  Future<void> getBibleVerse(bool isForBible) async {
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.getBibleVerse(isForBible);
      if (data.status) {
        BibleVerseModel? bibleVerseModel = BibleVerseModel.fromJson(data.data);
        if (isForBible) {
          emit(state.copyWith(thirtyDaysBibleVerse: bibleVerseModel));
        } else {
          emit(state.copyWith(homeDisplayBibleVerse: bibleVerseModel));
        }
      }
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
  }

  Future<bool> checkChallenge(bool isForgotToFail) async {
    bool isSuccessApiCall = false;
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.checkChallenge(isForgotToFail);
      if (data.status) {
        isSuccessApiCall = true;
      }
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
    return isSuccessApiCall;
  }

  Future<void> checkBibleVerseChallenge(bool isForgotToFail) async {
    EasyLoading.show();
    try {
      ResponseItem data =
          await _challengeRepo.checkBibleVerseChallenge(isForgotToFail);
      if (data.status) {
        // BibleVerseModel? bibleVerseModel = BibleVerseModel.fromJson(data.data);
        // if (isForBible) {
        //   emit(state.copyWith(thirtyDaysBibleVerse: bibleVerseModel));
        // } else {
        //   emit(state.copyWith(homeDisplayBibleVerse: bibleVerseModel));
        // }
      }
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
  }

  Future<void> addShareBibleVerseText(String bibleVerse) async {
    EasyLoading.show();
    try {
      ResponseItem data =
          await _challengeRepo.addShareBibleVerseText(bibleVerse);
      if (data.status) {}
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
  }

  Future<bool> logoutUser() async {
    bool isLogout = false;
    EasyLoading.show();
    try {
      ResponseItem data = await _authRepo.logoutUser();
      if (data.status) {
        isLogout = true;
      } else {
        if (data.forceLogout) {
          isLogout = true;
        }
      }
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
    return isLogout;
  }

  Future<bool> deleteAccount() async {
    bool isDeleteAccount = false;
    EasyLoading.show();
    try {
      ResponseItem data = await _authRepo.deleteAccount();
      if (data.status) {
        isDeleteAccount = true;
      } else {
        if (data.forceLogout) {
          isDeleteAccount = true;
        }
      }
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      EasyLoading.dismiss();
    }
    return isDeleteAccount;
  }
}
