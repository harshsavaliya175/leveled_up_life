import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/grateful_and_affirmation_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/get_grateful_list/get_grateful_list_data.dart';
import 'package:leveled_up_life/models/response_model/grateful_model/grateful_model.dart';

part 'grateful_cubit.freezed.dart';
part 'grateful_state.dart';

class GratefulCubit extends Cubit<GratefulState> {
  final GratefulAndAffirmationRepo _gratefulAndAffirmationRepo;

  GratefulCubit(this._gratefulAndAffirmationRepo)
      : super(const GratefulState());

  void initData() {
    emit(
      state.copyWith(
        file: null,
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      ),
    );
  }

  void changeData({
    int? dayIndex,
    DateTime? dateTime,
    File? file,
    String? date,
    String? addGratefulText,
  }) {
    emit(state.copyWith(
      message: '',
      responseItem: null,
      file: file ?? state.file,
      date: date ?? state.date,
      addGratefulText: addGratefulText ?? state.addGratefulText,
    ));
  }

  void gratefulDialogInit() {
    emit(state.copyWith(
      message: '',
      responseItem: null,
      file: null,
      addGratefulText: '',
      gratefulImage: '',
    ));
  }

  void getImageInit() {
    emit(state.copyWith(
      message: '',
      responseItem: null,
      file: null,
      gratefulImage: '',
    ));
  }

  Future<void> getGratefulList({required String date}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1, date: date));
    EasyLoading.show();
    try {
      ResponseItem data =
          await _gratefulAndAffirmationRepo.getGratefulList(GetGratefulListData(
        state.page,
        limit,
        state.date,
      ));
      List<GratefulModel> gratefulModelList = [];
      if (data.status) {
        List gratefulList = data.data as List;
        for (var element in gratefulList) {
          gratefulModelList.add(GratefulModel.fromJson(element));
        }
        emit(state.copyWith(gratefulModelList: gratefulModelList));
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

  Future<void> loadMoreGratefulData() async {
    if (state.gratefulModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data = await _gratefulAndAffirmationRepo
            .getGratefulList(GetGratefulListData(
          state.page,
          limit,
          state.date,
        ));
        List<GratefulModel> gratefulModelList = state.gratefulModelList;
        List<GratefulModel> gratefulModelListNew = [];
        gratefulModelListNew.addAll(gratefulModelList);
        List<GratefulModel> newLoadedData = [];
        if (data.status) {
          List gratefulList = data.data as List;
          for (var element in gratefulList) {
            newLoadedData.add(GratefulModel.fromJson(element));
          }
        }
        gratefulModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            gratefulModelList: gratefulModelListNew,
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

  Future<bool> addEditGratefulButton({
    bool isEdit = false,
    String gratefulId = '',
  }) async {
    bool isAddEditGrateful = false;
    emit(state.copyWith(responseItem: null, message: ''));
    if (addEditGratefulValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _gratefulAndAffirmationRepo.addEditGrateful(
          isEdit: isEdit,
          gratefulId: gratefulId,
          gratefulTitle: state.addGratefulText,
          gratefulDate: state.date,
          uploadImage: state.file,
        );
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
        ));
        isAddEditGrateful = true;
        EasyLoading.dismiss();
      } catch (e) {
        emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
        EasyLoading.dismiss();
      }
    }
    return isAddEditGrateful;
  }

  bool addEditGratefulValidation() {
    if (state.addGratefulText.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_title.tr()));
      return false;
    }
    // else if (state.file == null) {
    //   if (state.gratefulImage.isEmpty) {
    //     emit(state.copyWith(message: LocaleKeys.please_pick_image.tr()));
    //     return false;
    //   }
    // }
    return true;
  }

  void fillEditGratefulData({
    required String addGratefulText,
    required String gratefulImage,
  }) {
    emit(
      state.copyWith(
        responseItem: null,
        message: '',
        addGratefulText: addGratefulText,
        gratefulImage: gratefulImagePath + gratefulImage,
        file: null,
      ),
    );
  }
}
