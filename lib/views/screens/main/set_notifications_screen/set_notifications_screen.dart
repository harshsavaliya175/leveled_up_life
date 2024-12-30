import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/set_notifications_screen/bloc/set_notifications_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';
import 'package:leveled_up_life/views/widgets/set_notification_time_bottom_sheet_widget.dart';

class SetNotificationsScreen extends StatelessWidget {
  const SetNotificationsScreen({super.key});

  void showSetNotificationBottomSheet({
    required BuildContext context,
    required SetNotificationsState state,
    required bool isMotivation,
  }) {
    context.showAppBottomSheet(
      contentWidget: DraggableScrollableSheet(
        initialChildSize: 0.40,
        maxChildSize: 0.40,
        minChildSize: 0.40,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return SetNotificationTimeBottomSheetWidget(
            time: isMotivation
                ? state.motivationsQuotesTime
                : state.affirmationTime,
            isMotivation: isMotivation,
            onTap: (String time) {
              if (isMotivation) {
                context
                    .read<SetNotificationsCubit>()
                    .changeData(motivationsQuotesTime: time);
              } else {
                context
                    .read<SetNotificationsCubit>()
                    .changeData(affirmationTime: time);
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocConsumer<SetNotificationsCubit, SetNotificationsState>(
      listener: (BuildContext context, SetNotificationsState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, SetNotificationsState state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppBar(
              title: LocaleKeys.set_notifications.tr(),
              displayLeading: true,
            ),
          ),
          backgroundColor: primaryColor,
          body: Container(
            height: size.height,
            width: size.width,
            margin: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              child: Column(
                children: [
                  12.gapSpace(),
                  Center(
                    child: Container(
                      height: 5,
                      width: 70,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 20,
                        right: 20,
                      ),
                      children: [
                        12.gapSpace(),
                        Material(
                          color: coolFiftyColor,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              if (isPurchase) {
                                showSetNotificationBottomSheet(
                                  context: context,
                                  state: state,
                                  isMotivation: true,
                                );
                              } else {
                                // context.showAppSnackBar(
                                //     message:
                                //         LocaleKeys.subscriptionReqTxt.tr());
                                context.gotoSubscriptionScreen();
                              }
                            },
                            child: Container(
                              height: 52,
                              width: size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.motivations_quotes.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontFamily: FontFamily.avenirNextMedium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const VerticalDivider(
                                        color: dividerColor,
                                        width: 1,
                                      ).paddingAll(10),
                                      Switch(
                                        value: state.isMotivationsQuotes,
                                        activeTrackColor: primaryColor,
                                        activeColor: Colors.white,
                                        inactiveTrackColor: coolSixColor,
                                        onChanged: (bool value) {
                                          if (isPurchase) {
                                            context
                                                .read<SetNotificationsCubit>()
                                                .changeData(
                                                    isMotivationsQuotes: value);
                                            context
                                                .read<SetNotificationsCubit>()
                                                .setNotificationsButton();
                                          } else {
                                            context.gotoSubscriptionScreen();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        12.gapSpace(),
                        Material(
                          color: coolFiftyColor,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              if (true) {
                                showSetNotificationBottomSheet(
                                  context: context,
                                  state: state,
                                  isMotivation: false,
                                );
                              } else {
                                // context.showAppSnackBar(
                                //     message:
                                //         LocaleKeys.subscriptionReqTxt.tr());
                                context.gotoSubscriptionScreen();
                              }
                            },
                            child: Container(
                              height: 52,
                              width: size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.affirmation.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontFamily: FontFamily.avenirNextMedium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const VerticalDivider(
                                        color: dividerColor,
                                        width: 1,
                                      ).paddingAll(10),
                                      Switch(
                                        value: state.isAffirmation,
                                        activeTrackColor: primaryColor,
                                        activeColor: Colors.white,
                                        inactiveTrackColor: coolSixColor,
                                        onChanged: (bool value) {
                                          if (isPurchase) {
                                            context
                                                .read<SetNotificationsCubit>()
                                                .changeData(
                                                    isAffirmation: value);
                                            context
                                                .read<SetNotificationsCubit>()
                                                .setNotificationsButton();
                                          } else {
                                            // context.showAppSnackBar(
                                            //   message: LocaleKeys
                                            //       .subscriptionReqTxt
                                            //       .tr(),
                                            // );
                                            context.gotoSubscriptionScreen();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
