import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_request_model/challenge_request_model.dart';

part 'challenge_request_cubit.freezed.dart';
part 'challenge_request_state.dart';

class ChallengeRequestCubit extends Cubit<ChallengeRequestState> {
  final ChallengeRepo _challengeRepo;

  ChallengeRequestCubit(this._challengeRepo)
      : super(const ChallengeRequestState());

  void initData() {
    emit(const ChallengeRequestState());
  }

  Future<void> getChallengeRequestList() async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    EasyLoading.show();
    try {
      ResponseItem data =
          await _challengeRepo.getChallengeRequestList(state.page);
      List<ChallengeRequestModel?> challengeRequestModelList = [];
      if (data.status) {
        List challengeRequestList = data.data as List;
        for (var element in challengeRequestList) {
          challengeRequestModelList
              .add(ChallengeRequestModel.fromJson(element));
        }
        emit(state.copyWith(
            challengeRequestModelList: challengeRequestModelList));
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

  Future<void> loadMoreChallengeRequestData() async {
    if (state.challengeRequestModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _challengeRepo.getChallengeRequestList(state.page);
        List<ChallengeRequestModel?> challengeRequestModelList =
            state.challengeRequestModelList;
        List<ChallengeRequestModel?> challengeRequestModelListNew = [];
        challengeRequestModelListNew.addAll(challengeRequestModelList);
        List<ChallengeRequestModel?> newLoadedData = [];
        if (data.status) {
          List friendList = data.data as List;
          for (var element in friendList) {
            newLoadedData.add(ChallengeRequestModel.fromJson(element));
          }
        }
        challengeRequestModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            challengeRequestModelList: challengeRequestModelListNew,
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

  void removeDataWithOutApi(int index) {
    List<ChallengeRequestModel?> challengeRequestModels =
        state.challengeRequestModelList;
    List<ChallengeRequestModel?> challengeRequestModelsNew = [];
    challengeRequestModelsNew.addAll(challengeRequestModels);
    challengeRequestModelsNew.removeAt(index);
    emit(state.copyWith(challengeRequestModelList: challengeRequestModelsNew));
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
}
