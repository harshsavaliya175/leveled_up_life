import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/accept_reject_friend_request/accept_reject_friend_request_data.dart';
import 'package:leveled_up_life/models/request_model/get_challenges/get_challenges_data.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';
import 'package:leveled_up_life/models/response_model/friend_profile_model/friend_profile_model.dart';

part 'profile_details_cubit.freezed.dart';
part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  final FriendRepo _friendRepo;

  final ChallengeRepo _challengeRepo;

  ProfileDetailsCubit(this._friendRepo, this._challengeRepo)
      : super(const ProfileDetailsState());

  void changeData({List<ChallengeModel?>? challengeModelList}) {
    emit(state.copyWith(
        challengeModelList: challengeModelList ?? state.challengeModelList));
  }

  Future<void> getProfileDetails(String userToken) async {
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _friendRepo.friendProfileDetails(userToken);
      FriendProfileDetailsModel? profileModel;
      if (data.status) {
        profileModel = FriendProfileDetailsModel.fromJson(data.data);
      }
      emit(state.copyWith(profileModel: profileModel));
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
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
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isRemoveFriend;
  }

  Future<void> getChallengeList(String userToken) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    // EasyLoading.show();
    try {
      ResponseItem data =
          await _challengeRepo.getChallengeList(GetChallengesData(
        state.page,
        limit,
        userToken,
      ));
      List<ChallengeModel?> challengeModelList = [];
      if (data.status) {
        List challengeList = data.data as List;
        for (var element in challengeList) {
          challengeModelList.add(ChallengeModel.fromJson(element));
        }
      }
      emit(state.copyWith(challengeModelList: challengeModelList));
      //EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      //EasyLoading.dismiss();
    }
  }

  Future<void> loadMoreChallengeData(String userToken) async {
    if (state.challengeModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _challengeRepo.getChallengeList(GetChallengesData(
          state.page,
          limit,
          userToken,
        ));
        List<ChallengeModel?> challengeModelList = state.challengeModelList;
        List<ChallengeModel?> challengeModelListNew = [];
        challengeModelListNew.addAll(challengeModelList);
        List<ChallengeModel?> newLoadedData = [];
        if (data.status) {
          List friendList = data.data as List;
          for (var element in friendList) {
            newLoadedData.add(ChallengeModel.fromJson(element));
          }
        }
        challengeModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            challengeModelList: challengeModelListNew,
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
}
