import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/my_habit_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/request_model/add_edit_habit/add_edit_habit_data.dart';
import 'package:leveled_up_life/models/request_model/get_my_habits/get_my_habits_data.dart';
import 'package:leveled_up_life/models/response_model/my_habits_model/my_habits_model.dart';

part 'my_habit_cubit.freezed.dart';
part 'my_habit_state.dart';

class MyHabitCubit extends Cubit<MyHabitState> {
  final MyHabitRepo _myHabitRepo;

  MyHabitCubit(this._myHabitRepo) : super(const MyHabitState());

  void initData() {
    emit(const MyHabitState());
  }

  void changeData({
    String? habits,
    String? time,
    bool? isSetReminder,
  }) {
    emit(state.copyWith(
      responseItem: null,
      message: '',
      habits: habits ?? state.habits,
      time: time ?? state.time,
      isSetReminder: isSetReminder ?? state.isSetReminder,
    ));
  }

  Future<void> getHabitsList({bool isLoading = true}) async {
    emit(state.copyWith(responseItem: null, message: '', page: 1));
    if (isLoading) {
      EasyLoading.show();
    }
    try {
      ResponseItem data =
          await _myHabitRepo.getMyHabits(GetMyHabitsData(1, limit));
      List<MyHabitsModel?> myHabitsModelList = [];
      if (data.status) {
        List myHabitsList = data.data as List;
        for (var element in myHabitsList) {
          myHabitsModelList.add(MyHabitsModel.fromJson(element));
        }
        emit(state.copyWith(myHabitsModelList: myHabitsModelList));
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

  Future<void> loadMoreHabitData() async {
    if (state.myHabitsModelList.length == limit * state.page) {
      emit(state.copyWith(
          page: state.page + 1, message: '', isPaginationLoader: true));
      try {
        ResponseItem data =
            await _myHabitRepo.getMyHabits(GetMyHabitsData(state.page, limit));
        List<MyHabitsModel?> myHabitsModelList = state.myHabitsModelList;
        List<MyHabitsModel?> myHabitsModelListNew = [];
        myHabitsModelListNew.addAll(myHabitsModelList);
        List<MyHabitsModel?> newLoadedData = [];
        if (data.status) {
          List gratefulList = data.data as List;
          for (var element in gratefulList) {
            newLoadedData.add(MyHabitsModel.fromJson(element));
          }
        }
        myHabitsModelListNew.addAll(newLoadedData);
        emit(
          state.copyWith(
            myHabitsModelList: myHabitsModelListNew,
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

  void fillMyHabitData(MyHabitsModel? myHabitsModel) {
    emit(state.copyWith(
      habits: myHabitsModel?.habitName ?? '',
      isSetReminder: myHabitsModel?.isSetReminder == 1,
      time: myHabitsModel?.habitTime ?? '',
      message: '',
      responseItem: null,
    ));
  }

  Future<void> addEditHabit({
    bool isEdit = false,
    int habitId = 0,
    int index = 0,
  }) async {
    emit(state.copyWith(responseItem: null, message: ''));
    if (addEditHabitValidation()) {
      EasyLoading.show();
      try {
        ResponseItem data = await _myHabitRepo.addEditMyHabits(
          AddEditHabitData(
            habitId: habitId,
            habitName: state.habits,
            habitTime: state.time,
            isSetReminder: state.isSetReminder ? 1 : 0,
            type: isEdit ? edit : add,
          ),
        );
        List<MyHabitsModel?> myHabitModelList = state.myHabitsModelList;
        List<MyHabitsModel?> myHabitModelListNew = [];
        myHabitModelListNew.addAll(myHabitModelList);
        if (data.status) {
          MyHabitsModel myHabitsModel = MyHabitsModel.fromJson(data.data);
          if (isEdit) {
            myHabitModelListNew.removeAt(index);
            myHabitModelListNew.insert(index, myHabitsModel);
          } else {
            myHabitModelListNew.insert(0, myHabitsModel);
          }
          emit(state.copyWith(
            responseItem: data,
            message: data.message,
            myHabitsModelList: myHabitModelListNew,
          ));
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
  }

  bool addEditHabitValidation() {
    if (state.habits.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_habit.tr()));
      return false;
    }
    return true;
  }

  Future<void> deleteHabit({required int habitId, required int index}) async {
    emit(state.copyWith(responseItem: null, message: ''));
    EasyLoading.show();
    try {
      ResponseItem data = await _myHabitRepo.deleteMyHabits(habitId: habitId);
      List<MyHabitsModel?> myHabitModelList = state.myHabitsModelList;
      List<MyHabitsModel?> myHabitModelListNew = [];
      myHabitModelListNew.addAll(myHabitModelList);
      if (data.status) {
        myHabitModelListNew.removeAt(index);
        emit(state.copyWith(
          responseItem: data,
          message: data.message,
          myHabitsModelList: myHabitModelListNew,
        ));
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
}
