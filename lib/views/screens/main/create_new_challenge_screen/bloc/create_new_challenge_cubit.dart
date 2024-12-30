import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';

part 'create_new_challenge_cubit.freezed.dart';
part 'create_new_challenge_state.dart';

class CreateNewChallengeCubit extends Cubit<CreateNewChallengeState> {
  CreateNewChallengeCubit() : super(const CreateNewChallengeState());

  void initData() {
    emit(const CreateNewChallengeState());
  }

  void changeData({
    bool? isReminderStart,
    String? endDate,
    String? startDate,
    String? challengeName,
    String? taskName,
    bool? addTextField,
    List<String>? taskList,
    List<TextEditingController>? taskControllerList,
  }) {
    emit(state.copyWith(
      isReminderStart: isReminderStart ?? state.isReminderStart,
      endDate: endDate ?? state.endDate,
      startDate: startDate ?? state.startDate,
      challengeName: challengeName ?? state.challengeName,
      taskName: taskName ?? state.taskName,
      taskList: taskList ?? state.taskList,
      taskControllerList: taskControllerList ?? state.taskControllerList,
      message: '',
    ));
  }

  bool newChallengeValidation() {
    emit(state.copyWith(message: ''));
    bool isCurrentDay = false;

    if (state.endDate.isNotEmpty) {
      DateTime date = DateTime.parse(state.endDate).toLocal();
      if (date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year) {
        isCurrentDay = true;
      }
    }

    if (state.challengeName.isEmpty) {
      emit(
          state.copyWith(message: LocaleKeys.please_enter_challenge_name.tr()));
      return false;
    } else if (state.taskControllerList.last.text.trim().isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_enter_task_name.tr()));
      return false;
    } else if (state.endDate.isEmpty) {
      emit(state.copyWith(message: LocaleKeys.please_choose_date.tr()));
      return false;
    } else if (isCurrentDay) {
      emit(state.copyWith(
          message: LocaleKeys.please_add_more_than_one_day_challenge.tr()));
      return false;
    }
    return true;
  }
}
