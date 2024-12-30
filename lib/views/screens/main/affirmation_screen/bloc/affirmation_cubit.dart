import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/grateful_and_affirmation_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/add_affirmation/add_affirmation_data.dart';
import 'package:leveled_up_life/models/request_model/get_affirmation_list_data/get_affirmation_list_data.dart';
import 'package:leveled_up_life/models/response_model/affirmation_model/affirmation_model.dart';

part 'affirmation_cubit.freezed.dart';
part 'affirmation_state.dart';

class AffirmationCubit extends Cubit<AffirmationState> {
  final GratefulAndAffirmationRepo _gratefulAndAffirmationRepo;

  AffirmationCubit(this._gratefulAndAffirmationRepo)
      : super(const AffirmationState());

  void initData() {
    emit(state.copyWith(
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    ));
  }

  void changeData({
    int? dayIndex,
    DateTime? dateTime,
    String? date,
    String? addAffirmationText,
    bool? isForceLogout,
  }) {
    emit(state.copyWith(
      message: '',
      responseItem: null,
      date: date ?? state.date,
      addAffirmationText: addAffirmationText ?? state.addAffirmationText,
      isForceLogout: isForceLogout ?? state.isForceLogout,
    ));
  }

  Future<void> getAffirmationList({required String date}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1, date: date));
    EasyLoading.show();
    try {
      ResponseItem data = await _gratefulAndAffirmationRepo
          .getAffirmationList(GetAffirmationListData(
        state.page,
        limit,
        state.date,
      ));
      List<AffirmationModel> affirmationModelList = [];
      if (data.status) {
        List affirmationList = data.data as List;
        for (var element in affirmationList) {
          affirmationModelList.add(AffirmationModel.fromJson(element));
        }
        emit(state.copyWith(affirmationModelList: affirmationModelList));
      } else {
        emit(state.copyWith(
          message: data.message,
          responseItem: null,
          isPaginationLoader: false,
          isForceLogout: data.forceLogout,
        ));
      }
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
  }

  Future<void> loadMoreAffirmationData() async {
    if (state.affirmationModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data = await _gratefulAndAffirmationRepo
            .getAffirmationList(GetAffirmationListData(
          state.page,
          limit,
          state.date,
        ));
        List<AffirmationModel> affirmationModelList =
            state.affirmationModelList;
        List<AffirmationModel> affirmationModelListNew = [];
        affirmationModelListNew.addAll(affirmationModelList);
        List<AffirmationModel> newLoadedData = [];
        if (data.status) {
          List affirmationList = data.data as List;
          for (var element in affirmationList) {
            newLoadedData.add(AffirmationModel.fromJson(element));
          }
        }
        affirmationModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            affirmationModelList: affirmationModelListNew,
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

  Future<void> addAffirmationButton() async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (addAffirmationValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _gratefulAndAffirmationRepo.addAffirmation(
          AddAffirmationData(
            state.date,
            state.addAffirmationText,
          ),
        );
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
        ));
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
  }

  bool addAffirmationValidation() {
    if (state.addAffirmationText.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_title.tr()));
      return false;
    }
    return true;
  }
}
