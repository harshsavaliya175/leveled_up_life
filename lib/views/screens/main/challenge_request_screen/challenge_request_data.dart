import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_request_model/challenge_request_model.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/bloc/challenge_request_cubit.dart';
import 'package:leveled_up_life/views/widgets/challenge_request_widget.dart';

class ChallengeRequestData extends StatelessWidget {
  final ScrollController controller;

  const ChallengeRequestData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChallengeRequestCubit, ChallengeRequestState>(
      listener: (BuildContext context, ChallengeRequestState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, ChallengeRequestState state) {
        return Expanded(
          child: state.challengeRequestModelList.isEmpty
              ? Center(
                  child: Text(
                    LocaleKeys.no_request_data.tr(),
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ListView.separated(
                    controller: controller,
                    padding: const EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 32),
                    itemCount: state.challengeRequestModelList.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        12.gapSpace(),
                    itemBuilder: (BuildContext context, int index) {
                      ChallengeRequestModel? requestModel =
                          state.challengeRequestModelList[index];
                      return ChallengeRequestWidget(
                        taskList: requestModel?.challengeTaskList ?? [],
                        challengeTitle: requestModel?.challengeName ?? '',
                        challengeDuration:
                            "${requestModel?.totalDay ?? 0} ${LocaleKeys.days.tr()}",
                        onTapForReject: () async {
                          if (isPurchase) {
                            bool isRemove = await context
                                .read<ChallengeRequestCubit>()
                                .acceptRejectChallengeRequest(
                                  challengeFriendId:
                                      requestModel?.challengeFriendId ?? 0,
                                  type: reject,
                                );

                            if (isRemove) {
                              context
                                  .read<ChallengeRequestCubit>()
                                  .removeDataWithOutApi(index);
                            }
                          } else {
                            context.gotoSubscriptionScreen();
                          }
                        },
                        onTapForAccept: () async {
                          if (isPurchase) {
                            bool isAccept = await context
                                .read<ChallengeRequestCubit>()
                                .acceptRejectChallengeRequest(
                                  challengeFriendId:
                                      requestModel?.challengeFriendId ?? 0,
                                  type: accept,
                                );

                            if (isAccept) {
                              context
                                  .read<ChallengeRequestCubit>()
                                  .removeDataWithOutApi(index);
                            }
                          } else {
                            context.gotoSubscriptionScreen();
                          }
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
