import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/repo/other_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/accept_reject_friend_request/accept_reject_friend_request_data.dart';
import 'package:leveled_up_life/models/response_model/notification_model/notification_model.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final OtherRepo _otherRepo;
  final FriendRepo _friendRepo;
  final ChallengeRepo _challengeRepo;

  NotificationCubit(this._otherRepo, this._friendRepo, this._challengeRepo)
      : super(const NotificationState());

  Future<void> getNotificationList({bool isLoading = true}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (isLoading) {
      EasyLoading.show();
    }
    try {
      ResponseItem data =
          await _otherRepo.getNotificationsList(page: 1, limit: limit);
      List<NotificationModel?> notificationModelList = [];
      if (data.status) {
        List notificationList = data.data as List;
        for (var element in notificationList) {
          notificationModelList.add(NotificationModel.fromJson(element));
        }
      }
      emit(state.copyWith(notificationModelList: notificationModelList));
      if (isLoading) {
        EasyLoading.dismiss();
      }
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      if (isLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  Future<bool> removeOrAcceptFriend({
    required String oppUserToken,
    required String type,
  }) async {
    bool isRemoveOrAcceptFriend = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _friendRepo.acceptAndRejectFriendRequest(
          AcceptRejectFriendRequestData(type, oppUserToken));
      emit(state.copyWith(responseItem: data, message: data.message));
      isRemoveOrAcceptFriend = true;
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isRemoveOrAcceptFriend;
  }

  Future<bool> acceptRejectChallengeRequest({
    required int challengeFriendId,
    required String type,
  }) async {
    bool isRemoveFriend = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.acceptAndRejectChallengeRequest(
        type: type,
        challengeFriendId: challengeFriendId,
      );
      emit(state.copyWith(responseItem: data, message: data.message));
      isRemoveFriend = true;
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isRemoveFriend;
  }

  void removeDataWithOutApi(int index) {
    List<NotificationModel?> notificationsModel = state.notificationModelList;
    List<NotificationModel?> notificationsModelNew = [];
    notificationsModelNew.addAll(notificationsModel);
    notificationsModelNew.removeAt(index);
    emit(state.copyWith(notificationModelList: notificationsModelNew));
  }
}
