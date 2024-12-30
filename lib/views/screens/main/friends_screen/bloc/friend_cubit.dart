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

part 'friend_cubit.freezed.dart';
part 'friend_state.dart';

class FriendCubit extends Cubit<FriendState> {
  final FriendRepo _friendRepo;

  FriendCubit(this._friendRepo) : super(const FriendState());

  Future<void> getFriendList({bool isLoading = false}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (isLoading) {
      EasyLoading.show();
    }
    try {
      ResponseItem data =
          await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
        state.page,
        limit,
        friend,
      ));
      List<FriendModel?> friendModelList = [];
      if (data.status) {
        List friendList = data.data as List;
        for (var element in friendList) {
          friendModelList.add(FriendModel.fromJson(element));
        }
      }
      emit(state.copyWith(friendModelList: friendModelList));
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

  Future<void> loadMoreFriendData() async {
    if (state.friendModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _friendRepo.getFriendsAndRequestList(FriendAndRequestData(
          state.page,
          limit,
          friend,
        ));
        List<FriendModel?> friendModelList = state.friendModelList;
        List<FriendModel?> friendModelListNew = [];
        friendModelListNew.addAll(friendModelList);
        List<FriendModel?> newLoadedData = [];
        if (data.status) {
          List friendList = data.data as List;
          for (var element in friendList) {
            newLoadedData.add(FriendModel.fromJson(element));
          }
        }
        friendModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            friendModelList: friendModelListNew,
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

  Future<bool> removeFriend(String oppUserToken) async {
    bool isRemoveFriend = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _friendRepo.acceptAndRejectFriendRequest(
          AcceptRejectFriendRequestData(reject, oppUserToken));
      if (data.status) {
        emit(state.copyWith(
          responseItem: data,
          message: LocaleKeys.remove_friend_successfully.tr(),
        ));
      } else {
        emit(state.copyWith(responseItem: data, message: data.message));
      }
      isRemoveFriend = true;
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isRemoveFriend;
  }

  void changeButton(int index) {
    List<FriendModel?> friends = state.friendModelList;
    List<FriendModel?> friendsNew = [];
    friendsNew.addAll(friends);
    friendsNew.removeAt(index);
    emit(state.copyWith(friendModelList: friendsNew));
  }
}
