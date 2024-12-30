import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/bloc/my_habit_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_bottom_sheet_top_widget.dart';

class AddNewHabitBottomSheetWidget extends StatelessWidget {
  final ScrollController controller;

  final bool isEdit;
  final int habitId;
  final int editDataIndex;

  const AddNewHabitBottomSheetWidget({
    super.key,
    required this.controller,
    this.isEdit = false,
    this.habitId = 0,
    this.editDataIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            CommonBottomSheetTopWidget(
              onTap: () {
                context.pop();
              },
              title: isEdit
                  ? LocaleKeys.edit_habit.tr()
                  : LocaleKeys.add_new_habit.tr(),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                shrinkWrap: true,
                children: [
                  20.gapSpace(),
                  Text(
                    LocaleKeys.habit.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ).paddingOnly(left: 20),
                  8.gapSpace(),
                  BlocBuilder<MyHabitCubit, MyHabitState>(
                    builder: (BuildContext context, MyHabitState state) {
                      return AppTextField(
                        initialValue: state.habits,
                        fillColor: coolOneColor,
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        hintText: LocaleKeys.enter_habit.tr(),
                        onChange: (String val) {
                          context.read<MyHabitCubit>().changeData(habits: val);
                        },
                      );
                    },
                  ).paddingSymmetric(horizontal: 20),
                  20.gapSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.time.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                      5.gapSpace(),
                      Text(
                        LocaleKeys.optional.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: lightGreyColor,
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 20),
                  8.gapSpace(),
                  BlocBuilder<MyHabitCubit, MyHabitState>(
                    buildWhen: (MyHabitState previous, MyHabitState current) {
                      return previous.time != current.time;
                    },
                    builder: (BuildContext context, MyHabitState state) {
                      return AppTextField(
                        onTap: () async {
                          if (Platform.isIOS) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 250,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: CupertinoTimerPicker(
                                    initialTimerDuration: state.time.isEmpty
                                        ? Duration(
                                            hours: DateTime.now().hour,
                                            minutes: DateTime.now().minute,
                                          )
                                        : Duration(
                                            hours: int.parse(
                                                state.time.split(':')[0]),
                                            minutes: int.parse(
                                                state.time.split(':')[1]),
                                          ),
                                    mode: CupertinoTimerPickerMode.hm,
                                    onTimerDurationChanged: (Duration value) {
                                      log('value --> $value');
                                      String hour = value.inHours
                                          .toString()
                                          .padLeft(2, "0");
                                      num minuteDifference =
                                          value.inMinutes.toInt() -
                                              (int.parse(hour) * 60);
                                      String minute = minuteDifference
                                          .toString()
                                          .padLeft(2, "0");
                                      context
                                          .read<MyHabitCubit>()
                                          .changeData(time: "$hour:$minute:00");
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            TimeOfDay? pickedTime = await showTimePicker(
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData(
                                    timePickerTheme: TimePickerThemeData(
                                      dayPeriodColor:
                                          primaryColor.withOpacity(0.2),
                                    ),
                                    primaryColor: primaryColor,
                                    colorScheme: const ColorScheme.light(
                                        primary: primaryColor),
                                    buttonTheme: const ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary),
                                  ),
                                  child: child ?? Container(),
                                );
                              },
                              context: context,
                              initialTime: state.time.isEmpty
                                  ? TimeOfDay.now()
                                  : TimeOfDay(
                                      hour: int.parse(state.time.split(':')[0]),
                                      minute:
                                          int.parse(state.time.split(':')[1]),
                                    ),
                            );
                            if (pickedTime != null) {
                              String hour =
                                  pickedTime.hour.toString().padLeft(2, "0");
                              String minute =
                                  pickedTime.minute.toString().padLeft(2, "0");
                              context
                                  .read<MyHabitCubit>()
                                  .changeData(time: "$hour:$minute:00");
                            }
                          }
                        },
                        fillColor: coolOneColor,
                        readOnly: true,
                        action: TextInputAction.done,
                        type: TextInputType.text,
                        hintText: (state.time.isNotEmpty)
                            ? state.time.format(
                                outputFormat: 'hh:mm a',
                                inputFormat: 'hh:mm:ss',
                              )
                            : LocaleKeys.minute_second.tr(),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: (state.time.isNotEmpty)
                              ? lightBlackColor
                              : lightGreyColor,
                        ),
                        suffixIcon:
                            Assets.icons.icClock.svg(fit: BoxFit.scaleDown),
                        onChange: (String val) {},
                      );
                    },
                  ).paddingSymmetric(horizontal: 20),
                  10.gapSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.set_reminder.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamily.avenirNextMedium,
                          color: primaryColor,
                        ),
                      ),
                      BlocBuilder<MyHabitCubit, MyHabitState>(
                        buildWhen:
                            (MyHabitState previous, MyHabitState current) {
                          return previous.isSetReminder !=
                              current.isSetReminder;
                        },
                        builder: (BuildContext context, MyHabitState state) {
                          return Switch(
                            value: state.isSetReminder,
                            activeTrackColor: primaryColor,
                            activeColor: Colors.white,
                            inactiveTrackColor: coolSixColor,
                            onChanged: (bool value) {
                              if (isPurchase) {
                                context
                                    .read<MyHabitCubit>()
                                    .changeData(isSetReminder: value);
                              } else {
                                // context.showAppSnackBar(
                                //   message: LocaleKeys.subscriptionReqTxt.tr(),
                                // );
                                context.gotoSubscriptionScreen();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                  20.gapSpace(),
                  AppButton(
                    onTap: () async {
                      context.read<MyHabitCubit>().addEditHabit(
                            isEdit: isEdit,
                            habitId: habitId,
                            index: editDataIndex,
                          );
                      context.pop();
                    },
                    fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
                    child: Text(
                      isEdit ? LocaleKeys.save.tr() : LocaleKeys.add.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.avenirNextBold,
                        color: Colors.white,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 20, vertical: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
