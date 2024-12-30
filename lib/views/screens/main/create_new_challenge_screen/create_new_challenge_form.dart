import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';

import 'bloc/create_new_challenge_cubit.dart';

class CreateNewChallengeForm extends StatelessWidget {
  const CreateNewChallengeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CreateNewChallengeCubit, CreateNewChallengeState>(
        builder: (BuildContext context, CreateNewChallengeState state) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            children: [
              12.gapSpace(),
              Text(
                LocaleKeys.challenge_name.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamily.avenirNextMedium,
                  color: primaryColor,
                ),
              ),
              8.gapSpace(),
              AppTextField(
                radius: 8,
                fillColor: coolFiftyColor,
                action: TextInputAction.next,
                type: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                hintText: LocaleKeys.enter_name.tr(),
                onChange: (String val) {
                  context
                      .read<CreateNewChallengeCubit>()
                      .changeData(challengeName: val);
                },
              ),
              16.gapSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.task_name.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.avenirNextMedium,
                      color: primaryColor,
                    ),
                  ),
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        if (state.taskList.last.isNotEmpty) {
                          List<String> taskList = [];
                          taskList.addAll(state.taskList);
                          taskList.add("");

                          List<TextEditingController> taskControllerList = [];
                          taskControllerList.addAll(state.taskControllerList);
                          taskControllerList.add(TextEditingController());
                          context.read<CreateNewChallengeCubit>().changeData(
                                taskList: taskList,
                                taskControllerList: taskControllerList,
                              );
                        }
                      },
                      child: Text(
                        LocaleKeys.plus_add.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: FontFamily.avenirNextDemi,
                          color: buttonColor,
                        ),
                      ).paddingSymmetric(horizontal: 4, vertical: 2),
                    ),
                  ),
                ],
              ),
              8.gapSpace(),
              ListView.separated(
                itemCount: state.taskList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    8.gapSpace(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              radius: 8,
                              fillColor: coolFiftyColor,
                              controller: state.taskControllerList[index],
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              hintText: LocaleKeys.enter_task_name.tr(),
                              onChange: (String val) {
                                List<String> taskList = state.taskList;
                                List<String> taskListNew = [];
                                taskListNew.addAll(taskList);
                                if (taskListNew.isNotEmpty) {
                                  taskListNew[index] = val;
                                }
                                context
                                    .read<CreateNewChallengeCubit>()
                                    .changeData(taskList: taskListNew);
                              },
                            ),
                          ),
                          5.gapSpace(),
                          // if (index != 0)
                          IconButton(
                            onPressed: () {
                              if (state.taskList.length > 1) {
                                List<String> taskList = state.taskList;
                                List<String> taskListNew = [];
                                taskListNew.addAll(taskList);
                                taskListNew.removeAt(index);

                                List<TextEditingController> taskControllerList =
                                    state.taskControllerList;
                                List<TextEditingController>
                                    taskControllerListNew = [];
                                taskControllerListNew
                                    .addAll(taskControllerList);
                                taskControllerListNew.removeAt(index);
                                context
                                    .read<CreateNewChallengeCubit>()
                                    .changeData(
                                      taskList: taskListNew,
                                      taskControllerList: taskControllerListNew,
                                    );
                              }
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: (state.taskList.length > 1)
                                  ? Colors.red
                                  : coolFourColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              16.gapSpace(),
              Text(
                LocaleKeys.date.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamily.avenirNextMedium,
                  color: primaryColor,
                ),
              ),
              8.gapSpace(),
              BlocBuilder<CreateNewChallengeCubit, CreateNewChallengeState>(
                buildWhen: (CreateNewChallengeState previous,
                    CreateNewChallengeState current) {
                  return previous.endDate != current.endDate;
                },
                builder: (BuildContext context, CreateNewChallengeState state) {
                  return AppTextField(
                    radius: 8,
                    readOnly: true,
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
                              child: CupertinoDatePicker(
                                minimumDate: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                ),
                                initialDateTime: state.endDate.isEmpty
                                    ? DateTime.now()
                                    : DateTime.parse(state.endDate).toLocal(),
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (DateTime newDate) {
                                  newDate = newDate.copyWith(
                                    hour: DateTime.now().hour,
                                    minute: DateTime.now().minute,
                                    second: DateTime.now().second,
                                  );
                                  context
                                      .read<CreateNewChallengeCubit>()
                                      .changeData(
                                        endDate: newDate.toString(),
                                        startDate:
                                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                                .format(DateTime.now()),
                                      );
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        DateTime? pickedDate = await showDatePicker(
                          keyboardType: TextInputType.number,
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(3000),
                          initialDate: state.endDate.isEmpty
                              ? DateTime.now()
                              : DateTime.parse(state.endDate).toLocal(),
                        );
                        if (pickedDate != null) {
                          pickedDate = pickedDate.copyWith(
                            hour: DateTime.now().hour,
                            minute: DateTime.now().minute,
                            second: DateTime.now().second,
                          );
                          log('==> ${pickedDate.toString()}');
                          //ignore: use_build_context_synchronously
                          context.read<CreateNewChallengeCubit>().changeData(
                                endDate: pickedDate.toString(),
                                startDate: DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(DateTime.now()),
                              );
                        }
                      }
                    },
                    fillColor: coolFiftyColor,
                    action: TextInputAction.done,
                    type: TextInputType.text,
                    hintText: state.endDate.isNotEmpty
                        ? state.endDate.format(
                            outputFormat: 'MM/dd/yyyy',
                            inputFormat: 'yyyy-MM-dd',
                          )
                        : LocaleKeys.date_format.tr(),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: state.endDate.isNotEmpty
                          ? lightBlackColor
                          : lightGreyColor,
                    ),
                    onChange: (String val) {},
                    suffixIcon: Assets.icons.icDate.svg(fit: BoxFit.scaleDown),
                  );
                },
              ),
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
                  BlocBuilder<CreateNewChallengeCubit, CreateNewChallengeState>(
                    buildWhen: (CreateNewChallengeState previous,
                        CreateNewChallengeState current) {
                      return previous.isReminderStart !=
                          current.isReminderStart;
                    },
                    builder:
                        (BuildContext context, CreateNewChallengeState state) {
                      return Switch(
                        value: state.isReminderStart,
                        activeTrackColor: primaryColor,
                        activeColor: Colors.white,
                        inactiveTrackColor: coolSixColor,
                        onChanged: (bool value) {
                          context
                              .read<CreateNewChallengeCubit>()
                              .changeData(isReminderStart: value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
