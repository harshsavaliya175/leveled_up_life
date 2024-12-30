import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/accept_reject_friend_request/accept_reject_friend_request_data.dart';
import 'package:leveled_up_life/models/request_model/search_friend/search_friend_data.dart';
import 'package:leveled_up_life/models/response_model/search_friend_model/search_friend_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'find_friend_cubit.freezed.dart';
part 'find_friend_state.dart';

class FindFriendCubit extends Cubit<FindFriendState> {
  final FriendRepo _friendRepo;

  FindFriendCubit(this._friendRepo) : super(const FindFriendState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const FindFriendState());
  }

  void changeData({
    String? searchText,
    List<SearchFriendModel?>? friends,
  }) {
    emit(state.copyWith(
      message: '',
      responseItem: null,
      searchText: searchText ?? state.searchText,
      searchFriendModelList: friends ?? state.searchFriendModelList,
    ));
  }

  Future<void> getFriendRequestCount() async {
    emit(state.copyWith(message: '', responseItem: null));
    try {
      ResponseItem data = await _friendRepo.getFriendRequestCount();
      emit(state.copyWith(getFriendRequestCount: data.data[requestCount]));
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
    }
  }

  Future<void> getSearchFriendList({bool callFromSearch = false}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (!callFromSearch) {
      EasyLoading.show();
    }
    try {
      ResponseItem data = await _friendRepo.getSearchFriend(SearchFriendData(
        state.page,
        limit,
        state.searchText,
      ));
      List<SearchFriendModel?> searchFriendModelList = [];
      if (data.status) {
        List searchFriendList = data.data as List;
        for (var element in searchFriendList) {
          searchFriendModelList.add(SearchFriendModel.fromJson(element));
        }
        emit(state.copyWith(searchFriendModelList: searchFriendModelList));
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

  void changeButton({required int index, required int? isAccept}) {
    String? userToken = preferences.getString(SharedPreference.userToken);
    List<SearchFriendModel?> friends = state.searchFriendModelList;
    List<SearchFriendModel?> friendsNew = [];
    friendsNew.addAll(friends);
    SearchFriendModel? searchFriend = friendsNew[index];

    if (searchFriend?.isAccept == null ||
        (searchFriend?.isAccept == 0 &&
            searchFriend?.senderToken == userToken)) {
      searchFriend = searchFriend?.copyWith(
        isAccept: isAccept,
        senderToken: userToken,
        receiverToken: searchFriend.receiverToken,
      );
    } else {
      searchFriend = searchFriend?.copyWith(
        isAccept: isAccept,
        senderToken: null,
        receiverToken: null,
      );
    }
    friendsNew[index] = searchFriend;
    emit(state.copyWith(searchFriendModelList: friendsNew));
  }

  Future<void> loadMoreSearchFriendData() async {
    if (state.searchFriendModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data = await _friendRepo.getSearchFriend(SearchFriendData(
          state.page,
          limit,
          state.searchText,
        ));
        List<SearchFriendModel?> searchFriendModelList =
            state.searchFriendModelList;
        List<SearchFriendModel?> searchFriendModelListNew = [];
        searchFriendModelListNew.addAll(searchFriendModelList);
        List<SearchFriendModel?> newLoadedData = [];
        if (data.status) {
          List friendList = data.data as List;
          for (var element in friendList) {
            newLoadedData.add(SearchFriendModel.fromJson(element));
          }
        }
        searchFriendModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            searchFriendModelList: searchFriendModelListNew,
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

  Future<bool> removeAndAcceptFriend(
      {required String oppUserToken, required String type}) async {
    bool isRemoveFriend = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _friendRepo.acceptAndRejectFriendRequest(
          AcceptRejectFriendRequestData(type, oppUserToken));
      emit(state.copyWith(responseItem: data, message: data.message));
      isRemoveFriend = true;
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
    return isRemoveFriend;
  }

  Future<bool> sendFriendRequest(String oppUserToken) async {
    bool isSendFriend = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _friendRepo.sendFriendRequest(oppUserToken);
      emit(state.copyWith(responseItem: data, message: data.message));
      isSendFriend = true;
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isSendFriend;
  }
}
