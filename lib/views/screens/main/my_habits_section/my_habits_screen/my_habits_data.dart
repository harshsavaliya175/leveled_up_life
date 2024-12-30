import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/bloc/my_habit_cubit.dart';
import 'package:leveled_up_life/views/widgets/add_new_habit_bottom_sheet_widget.dart';
import 'package:leveled_up_life/views/widgets/alert_dialog_widget.dart';

class MyHabitsData extends StatelessWidget {
  final ScrollController scrollController;

  const MyHabitsData({super.key, required this.scrollController});

  Future<void> showMyHabitsBottomSheet(
      BuildContext context, int habitId, int editDataIndex) async {
    await context.showAppBottomSheet(
      contentWidget: DraggableScrollableSheet(
        initialChildSize: 0.65,
        maxChildSize: 1,
        minChildSize: 0.65,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return AddNewHabitBottomSheetWidget(
            controller: scrollController,
            isEdit: true,
            habitId: habitId,
            editDataIndex: editDataIndex,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocBuilder<MyHabitCubit, MyHabitState>(
      builder: (BuildContext context, MyHabitState state) {
        return state.myHabitsModelList.isEmpty
            ? Center(
                child: Text(
                  LocaleKeys.habits_not_fount.tr(),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.separated(
                controller: scrollController,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: 80,
                ),
                itemCount: state.myHabitsModelList.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    12.gapSpace(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Material(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            context.read<MyHabitCubit>().fillMyHabitData(
                                  state.myHabitsModelList[index],
                                );
                            showMyHabitsBottomSheet(
                              context,
                              state.myHabitsModelList[index]?.habitId ?? 0,
                              index,
                            );
                          },
                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    state.myHabitsModelList[index]?.habitName ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontFamily: FontFamily.avenirNextMedium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.zero,
                                          width: 36,
                                          alignment: Alignment.centerLeft,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(6),
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              context
                                                  .read<MyHabitCubit>()
                                                  .fillMyHabitData(
                                                    state.myHabitsModelList[
                                                        index],
                                                  );
                                              showMyHabitsBottomSheet(
                                                context,
                                                state.myHabitsModelList[index]
                                                        ?.habitId ??
                                                    0,
                                                index,
                                              );
                                            },
                                            icon: Assets.icons.icEdit.svg(
                                              height: 18,
                                              width: 18,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.zero,
                                          width: 36,
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(6),
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              context.showAppDialog(
                                                contentWidget:
                                                    AlertDialogWidget(
                                                  title: LocaleKeys
                                                      .are_you_sure_you_want_to_delete
                                                      .tr(),
                                                  onTap: () async {
                                                    context
                                                        .read<MyHabitCubit>()
                                                        .deleteHabit(
                                                          habitId: state
                                                                  .myHabitsModelList[
                                                                      index]
                                                                  ?.habitId ??
                                                              0,
                                                          index: index,
                                                        );
                                                    context.pop();
                                                  },
                                                ),
                                              );
                                            },
                                            icon: Assets.icons.icDelete.svg(
                                              height: 18,
                                              width: 18,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (state.isPaginationLoader) &&
                            (index == (state.myHabitsModelList.length - 1)),
                        child: Column(
                          children: [
                            20.gapSpace(),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
      },
    );
  }
}
