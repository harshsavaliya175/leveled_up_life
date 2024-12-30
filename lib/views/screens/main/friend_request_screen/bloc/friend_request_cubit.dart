import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/accept_reject_friend_request/accept_reject_friend_request_data.dart';
import 'package:leveled_up_life/models/request_model/friend_and_request/friend_and_request_data.dart';
import 'package:leveled_up_life/models/response_model/friend_model/friend_model.dart';

part 'friend_request_cubit.freezed.dart';
part 'friend_request_state.dart';

class FriendRequestCubit extends Cubit<FriendRequestState> {
  final FriendRepo _friendRepo;

  FriendRequestCubit(this._friendRepo) : super(const FriendRequestState());

  Future<void> getFriendRequestList({bool isLoading = true}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (isLoading) {
      EasyLoading.show();
    }
    try {
      ResponseItem data =
          await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
        state.page,
        limit,
        friendRequest,
      ));
      List<FriendModel?> friendRequestModelList = [];
      if (data.status) {
        List friendRequestList = data.data as List;
        for (var element in friendRequestList) {
          friendRequestModelList.add(FriendModel.fromJson(element));
        }
        emit(state.copyWith(friendRequestModelList: friendRequestModelList));
      } else {
        if (data.forceLogout) {
          emit(state.copyWith(
            message: data.message,
            responseItem: null,
            isForceLogout: data.forceLogout,
          ));
        }
      }

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

  void removeDataWithOutApi(int index) {
    List<FriendModel?> friends = state.friendRequestModelList;
    List<FriendModel?> friendsNew = [];
    friendsNew.addAll(friends);
    friendsNew.removeAt(index);
    emit(state.copyWith(friendRequestModelList: friendsNew));
  }

  Future<void> loadMoreFriendRequestData() async {
    if (state.friendRequestModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
          state.page,
          limit,
          friend,
        ));
        List<FriendModel?> friendRequestModelList =
            state.friendRequestModelList;
        List<FriendModel?> friendRequestModelListNew = [];
        friendRequestModelListNew.addAll(friendRequestModelList);
        List<FriendModel?> newLoadedData = [];
        if (data.status) {
          List friendRequestList = data.data as List;
          for (var element in friendRequestList) {
            newLoadedData.add(FriendModel.fromJson(element));
          }
        }
        friendRequestModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            friendRequestModelList: friendRequestModelListNew,
            isPaginationLoader: false,
          ),
        );
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
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
      if (data.forceLogout) {
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
    return isRemoveOrAcceptFriend;
  }
}
