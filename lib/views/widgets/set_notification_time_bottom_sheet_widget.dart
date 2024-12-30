import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/set_notifications_screen/bloc/set_notifications_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_bottom_sheet_top_widget.dart';

class SetNotificationTimeBottomSheetWidget extends StatefulWidget {
  final String time;
  final Function(String time) onTap;
  final bool isMotivation;

  const SetNotificationTimeBottomSheetWidget({
    super.key,
    required this.time,
    required this.onTap,
    this.isMotivation = true,
  });

  @override
  State<SetNotificationTimeBottomSheetWidget> createState() =>
      _SetNotificationTimeBottomSheetWidgetState();
}

class _SetNotificationTimeBottomSheetWidgetState
    extends State<SetNotificationTimeBottomSheetWidget> {
  String time = '';

  @override
  void initState() {
    time = widget.time;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        shrinkWrap: true,
        children: [
          CommonBottomSheetTopWidget(
            title: LocaleKeys.set_time.tr(),
            onTap: () {
              context.pop();
            },
          ),
          20.gapSpace(),
          Text(
            LocaleKeys.time.tr(),
            style: const TextStyle(
              fontSize: 16,
              color: primaryColor,
            ),
          ).paddingOnly(left: 20),
          8.gapSpace(),
          BlocBuilder<SetNotificationsCubit, SetNotificationsState>(
            builder: (BuildContext context, SetNotificationsState state) {
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
                            initialTimerDuration: Duration(
                              hours: int.parse(time.split(':')[0]),
                              minutes: int.parse(time.split(':')[1]),
                            ),
                            mode: CupertinoTimerPickerMode.hm,
                            onTimerDurationChanged: (Duration value) {
                              String hour =
                                  value.inHours.toString().padLeft(2, "0");
                              num minuteDifference = value.inMinutes.toInt() -
                                  (int.parse(hour) * 60);
                              String minute =
                                  minuteDifference.toString().padLeft(2, "0");
                              time = "$hour:$minute:00";
                              setState(() {});
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
                              dayPeriodColor: primaryColor.withOpacity(0.2),
                            ),
                            primaryColor: primaryColor,
                            colorScheme:
                                const ColorScheme.light(primary: primaryColor),
                            buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary),
                          ),
                          child: child ?? Container(),
                        );
                      },
                      context: context,
                      initialTime: time.isEmpty
                          ? TimeOfDay.now()
                          : TimeOfDay(
                              hour: int.parse(time.split(':')[0]),
                              minute: int.parse(time.split(':')[1]),
                            ),
                    );
                    if (pickedTime != null) {
                      String hour = pickedTime.hour.toString().padLeft(2, "0");
                      String minute =
                          pickedTime.minute.toString().padLeft(2, "0");

                      time = "$hour:$minute:00";
                      setState(() {});
                    }
                  }
                },
                fillColor: coolOneColor,
                readOnly: true,
                action: TextInputAction.done,
                type: TextInputType.text,
                hintText: (time.isNotEmpty)
                    ? time.format(
                        outputFormat: 'hh:mm a',
                        inputFormat: 'HH:mm:ss',
                      )
                    : DateFormat('hh:mm a').format(
                        DateTime.now(),
                      ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: lightBlackColor,
                ),
                suffixIcon: Assets.icons.icClock.svg(fit: BoxFit.scaleDown),
                onChange: (String val) {},
              );
            },
          ).paddingSymmetric(horizontal: 20),
          20.gapSpace(),
          AppButton(
            fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
            onTap: () {
              widget.onTap(time);
              if (widget.isMotivation) {
                context
                    .read<SetNotificationsCubit>()
                    .changeData(isMotivationsQuotes: true);
              } else {
                context
                    .read<SetNotificationsCubit>()
                    .changeData(isAffirmation: true);
              }
              context
                  .read<SetNotificationsCubit>()
                  .setNotificationsButton()
                  .then(
                (bool value) {
                  if (value) {
                    context.pop();
                  }
                },
              );
            },
            child: Text(
              LocaleKeys.add.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.avenirNextBold,
                color: Colors.white,
              ),
            ),
          ).paddingAll(20),
        ],
      ),
    );
  }
}
