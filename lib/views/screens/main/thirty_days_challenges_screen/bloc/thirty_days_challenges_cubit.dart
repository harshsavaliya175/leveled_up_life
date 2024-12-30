import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/summary_chart_model/summary_chart_model.dart';
import 'package:leveled_up_life/models/response_model/thirty_days_data_model/thirty_days_data_model.dart';

part 'thirty_days_challenges_cubit.freezed.dart';
part 'thirty_days_challenges_state.dart';

class ThirtyDaysChallengesCubit extends Cubit<ThirtyDaysChallengesState> {
  final ChallengeRepo _challengeRepo;

  ThirtyDaysChallengesCubit(this._challengeRepo)
      : super(const ThirtyDaysChallengesState());

  void initData() {
    emit(const ThirtyDaysChallengesState());
  }

  void changeData({
    int? dayIndex,
    int? selectedIndex,
    int? chartSelectedIndex,
  }) {
    emit(
      state.copyWith(
        dayIndex: dayIndex ?? state.dayIndex,
        selectedIndex: selectedIndex ?? state.selectedIndex,
        chartSelectedIndex: chartSelectedIndex ?? state.chartSelectedIndex,
      ),
    );
  }

  Future<void> getChallengeRequestList({int index = 0}) async {
    emit(state.copyWith(responseItem: null, message: '', selectedIndex: index));
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.getThirtyDaysChallenge(
        index == 0
            ? daily
            : index == 1
                ? weekly
                : monthly,
      );
      if (data.status) {
        ThirtyDaysDataModel? thirtyDaysDataModel =
            ThirtyDaysDataModel.fromJson(data.data);
        emit(state.copyWith(
          thirtyDaysDataModel: thirtyDaysDataModel,
          dayIndex: thirtyDaysDataModel.days,
        ));
      } else {
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
  }

  Future<bool> completeDailyChallenge(int daysChallengeId) async {
    bool isChallengeComplete = false;
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data =
          await _challengeRepo.completeDailyChallenge(daysChallengeId);
      if (data.status) {
        emit(state.copyWith(responseItem: data, message: data.message));
      } else {
        emit(
          state.copyWith(
            message: data.message,
            responseItem: null,
            isForceLogout: data.forceLogout,
          ),
        );
      }
      isChallengeComplete = true;
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
    return isChallengeComplete;
  }

  Future<void> getSummaryChart({int chartSelectedIndex = 0}) async {
    emit(state.copyWith(
      responseItem: null,
      message: '',
      chartSelectedIndex: chartSelectedIndex,
    ));
    EasyLoading.show();
    try {
      ResponseItem data = await _challengeRepo.getSummaryChart(
        chartSelectedIndex == 0
            ? daily
            : chartSelectedIndex == 1
                ? weekly
                : monthly,
      );
      if (data.status) {
        SummaryChartModel? summaryChartModel =
            SummaryChartModel.fromJson(data.data);
        emit(state.copyWith(summaryChartModel: summaryChartModel));
      } else {
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
  }
}
