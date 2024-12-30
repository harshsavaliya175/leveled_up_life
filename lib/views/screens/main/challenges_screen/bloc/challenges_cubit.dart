import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/get_challenges/get_challenges_data.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'challenges_cubit.freezed.dart';
part 'challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  final ChallengeRepo _challengeRepo;

  ChallengesCubit(this._challengeRepo) : super(const ChallengesState());
  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const ChallengesState());
  }

  void changeData({List<ChallengeModel?>? challengeModelList}) {
    emit(state.copyWith(
        challengeModelList: challengeModelList ?? state.challengeModelList));
  }

  Future<void> getChallengeRequestCount() async {
    emit(state.copyWith(message: '', responseItem: null));
    try {
      ResponseItem data = await _challengeRepo.getChallengeRequestCount();
      emit(state.copyWith(getChallengeRequestCount: data.data[requestCount]));
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
    }
  }

  Future<void> getChallengeList({bool isLoading = true}) async {
    String? userToken = preferences.getString(SharedPreference.userToken);
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (isLoading) {
      EasyLoading.show();
    }
    try {
      ResponseItem data =
          await _challengeRepo.getChallengeList(GetChallengesData(
        state.page,
        limit,
        userToken ?? '',
      ));
      List<ChallengeModel?> challengeModelList = [];
      if (data.status) {
        List challengeList = data.data as List;
        for (var element in challengeList) {
          challengeModelList.add(ChallengeModel.fromJson(element));
        }
        emit(state.copyWith(challengeModelList: challengeModelList));
      } else {
        if (data.forceLogout) {
          emit(
            state.copyWith(
              message: data.message,
              responseItem: null,
              isForceLogout: data.forceLogout,
            ),
          );
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

  Future<void> loadMoreChallengeData() async {
    String? userToken = preferences.getString(SharedPreference.userToken);
    if (state.challengeModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _challengeRepo.getChallengeList(GetChallengesData(
          state.page,
          limit,
          userToken ?? '',
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
