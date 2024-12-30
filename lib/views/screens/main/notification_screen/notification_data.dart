import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/config/theme/app_theme.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/notification_model/notification_model.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/bloc/notification_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_outline_button.dart';

class NotificationData extends StatelessWidget {
  const NotificationData({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (BuildContext context, NotificationState state) {
        return state.notificationModelList.isEmpty
            ? Center(
                child: Text(
                  LocaleKeys.notifications_not_found.tr(),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 20,
                  right: 20,
                  bottom: 32,
                ),
                itemCount: state.notificationModelList.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    12.gapSpace(),
                itemBuilder: (BuildContext context, int index) {
                  NotificationModel? notification =
                      state.notificationModelList[index];
                  String type = notification?.type ?? '';
                  String title = '';
                  if (type == sendFriendRequest) {
                    title = LocaleKeys.user_has_sent_you_a_friend_request
                        .tr(args: [notification?.userName ?? '']);
                  } else if (type == sendChallengeRequest) {
                    title = LocaleKeys.user_has_sent_you_a_challenge_request
                        .tr(args: [notification?.userName ?? '']);
                  } else if (type == acceptFriendRequest) {
                    title = LocaleKeys.user_has_accept_your_friend_request
                        .tr(args: [notification?.userName ?? '']);
                  } else if (type == acceptChallengeRequest) {
                    title = LocaleKeys.user_has_accept_your_challenge_request
                        .tr(args: [notification?.userName ?? '']);
                  } else if (type == affirmation) {
                    title = LocaleKeys.please_add_your_affirmation.tr();
                  } else if (type == motivationsQuotes) {
                    title = notification?.gratefulTitle ?? '';
                  } else if (type == habits) {
                    title = LocaleKeys.complete_your_habit
                        .tr(args: [notification?.habitName ?? '']);
                  } else if (type == thirtyDaysChallenge) {
                    title = LocaleKeys.complete_your_thirty_days_challenge.tr();
                  } else if (type == checkThirtyDaysChallenge) {
                    title = LocaleKeys
                        .check_thirty_days_challenge_notification_text
                        .tr();
                  } else if (type == thirtyZDaysBibleVerseChallenge) {
                    title = LocaleKeys
                        .check_thirty_days_bible_verse_notification_text
                        .tr();
                  }
                  String time = '';
                  if ((notification?.notificationDate.isNotEmpty ?? false) &&
                      (notification?.currentUtcDate.isNotEmpty ?? false)) {
                    time = notification!.currentUtcDate
                        .formatTimeDifference(notification.notificationDate);
                  }
                  return Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: tileColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((type == sendFriendRequest) ||
                            (type == sendChallengeRequest) ||
                            (type == acceptFriendRequest) ||
                            (type == acceptChallengeRequest))
                          Column(
                            children: [
                              Text(
                                notification?.userName ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                              5.gapSpace(),
                            ],
                          ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                            fontFamily: FontFamily.avenirNextRegular,
                          ),
                        ),
                        Text(
                          time,
                          style: AppTheme.latoTextStyle,
                        ),
                        if ((type == sendFriendRequest) ||
                            (type == sendChallengeRequest))
                          Row(
                            children: [
                              AppButton(
                                onTap: () {
                                  if (type == sendFriendRequest) {
                                    context
                                        .read<NotificationCubit>()
                                        .removeOrAcceptFriend(
                                          oppUserToken:
                                              notification?.senderToken ?? '',
                                          type: accept,
                                        )
                                        .then(
                                      (bool value) {
                                        if (value) {
                                          context
                                              .read<NotificationCubit>()
                                              .removeDataWithOutApi(index);
                                        }
                                      },
                                    );
                                  } else if (type == sendChallengeRequest) {
                                    context
                                        .read<NotificationCubit>()
                                        .acceptRejectChallengeRequest(
                                          challengeFriendId:
                                              notification?.challengeFriendId ??
                                                  0,
                                          type: accept,
                                        )
                                        .then(
                                      (bool value) {
                                        if (value) {
                                          context
                                              .read<NotificationCubit>()
                                              .removeDataWithOutApi(index);
                                        }
                                      },
                                    );
                                  }
                                },
                                appButtonColor: primaryColor,
                                child: Text(
                                  LocaleKeys.accept.tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              8.gapSpace(),
                              AppOutlineButton(
                                onTap: () {
                                  if (type == sendFriendRequest) {
                                    context
                                        .read<NotificationCubit>()
                                        .removeOrAcceptFriend(
                                          oppUserToken:
                                              notification?.senderToken ?? '',
                                          type: reject,
                                        )
                                        .then(
                                      (bool value) {
                                        if (value) {
                                          context
                                              .read<NotificationCubit>()
                                              .removeDataWithOutApi(index);
                                        }
                                      },
                                    );
                                  } else if (type == sendChallengeRequest) {
                                    context
                                        .read<NotificationCubit>()
                                        .acceptRejectChallengeRequest(
                                          challengeFriendId:
                                              notification?.challengeFriendId ??
                                                  0,
                                          type: reject,
                                        )
                                        .then(
                                      (bool value) {
                                        if (value) {
                                          context
                                              .read<NotificationCubit>()
                                              .removeDataWithOutApi(index);
                                        }
                                      },
                                    );
                                  }
                                },
                                child: Text(LocaleKeys.reject.tr()),
                              )
                            ],
                          ).paddingOnly(top: 8),
                      ],
                    ).paddingAll(16),
                  );
                },
              );
      },
    );
  }
}
