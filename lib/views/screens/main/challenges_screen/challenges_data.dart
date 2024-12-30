import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/app_utils.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';
import 'package:leveled_up_life/models/response_model/participate_model/participate_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/bloc/challenge_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/bloc/challenges_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_image_stack_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ChallengesData extends StatelessWidget {
  final ScrollController controller;

  const ChallengesData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    String? userToken = preferences.getString(SharedPreference.userToken);
    return BlocConsumer<ChallengesCubit, ChallengesState>(
      listener: (BuildContext context, ChallengesState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, ChallengesState state) {
        return state.challengeModelList.isEmpty
            ? Center(
                child: Text(
                  LocaleKeys.challenges_not_found.tr(),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.separated(
                controller: controller,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: 80,
                ),
                itemCount: state.challengeModelList.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    12.gapSpace(),
                itemBuilder: (BuildContext context, int index) {
                  ChallengeModel? challenge = state.challengeModelList[index];
                  bool isYouWin = false;
                  int count = 0;
                  challenge?.participateList?.forEach(
                    (ParticipateModel element) {
                      if (userToken == element.userToken) {
                        count = element.count ?? 0;
                        if (element.count == challenge?.totalDay) {
                          isYouWin = true;
                        }
                      }
                    },
                  );
                  return Column(
                    children: [
                      Material(
                        color: coolFiftyColor,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            List<ParticipateModel>? participateModelList =
                                challenge?.participateList;
                            List<ParticipateModel> participateModelListNew = [];
                            participateModelListNew
                                .addAll(participateModelList ?? []);
                            int idx = participateModelListNew.indexWhere(
                              (ParticipateModel element) {
                                return element.userToken == userToken;
                              },
                            );
                            ParticipateModel participateModel =
                                participateModelListNew[idx];
                            participateModelListNew.removeAt(idx);
                            participateModelListNew.insert(0, participateModel);

                            challenge = challenge?.copyWith(
                              participateList: participateModelListNew,
                            );

                            context
                                .read<ChallengeDetailsCubit>()
                                .changeData(challengeModel: challenge);
                            context.pushNamed(AppRoutes.challengeDetail).then(
                              (value) {
                                if (value != null) {
                                  List<ChallengeModel?> challenges =
                                      state.challengeModelList;
                                  List<ChallengeModel?> challengesNew = [];
                                  challengesNew.addAll(challenges);
                                  challengesNew[index] =
                                      value as ChallengeModel;
                                  context.read<ChallengesCubit>().changeData(
                                      challengeModelList: challengesNew);
                                }
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      challenge?.challengeName ?? '',
                                      style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontFamily: FontFamily.avenirNextMedium,
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          ((challenge?.isChallengeComplete ??
                                                  0) ==
                                              0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(5),
                                        onTap: () async {
                                          String? generateShortUrl = await si
                                              .get<AppUtils>()
                                              .generateShortUrl(
                                                challengeName:
                                                    challenge?.challengeName ??
                                                        '',
                                                challengeId:
                                                    "${challenge?.challengeId ?? 0}",
                                              );
                                          log("generateShortUrl ------------------> $generateShortUrl");

                                          await SharePlusUtil()
                                              .shareTextOrImage(
                                            shareText:
                                                "You have been invite to join ${challenge?.challengeName ?? ""} challenge\n\nPlease use this link to join the challenge: ${generateShortUrl ?? ""}",
                                            shareImageUrl: '',
                                          );
                                        },
                                        child: const Icon(
                                          Icons.share,
                                          size: 20,
                                        ).paddingAll(2),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  challenge?.challengeTaskList?[0]
                                          .challengeTaskName ??
                                      '',
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextRegular,
                                  ),
                                ),
                                if ((challenge?.challengeTaskList?.length ??
                                        0) >
                                    1)
                                  Text(
                                    LocaleKeys.plus_task.tr(args: [
                                      "${challenge!.challengeTaskList!.length - 1}"
                                    ]),
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 12,
                                      fontFamily: FontFamily.avenirNextRegular,
                                    ),
                                  ),
                                12.gapSpace(),
                                Row(
                                  children: [
                                    Assets.icons.icWatch
                                        .svg(height: 20, width: 20),
                                    12.gapSpace(),
                                    Text(
                                      '${challenge?.totalDay ?? 0} ${LocaleKeys.days.tr()}',
                                      style: const TextStyle(
                                        color: coolFiveColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                20.gapSpace(),
                                LinearPercentIndicator(
                                  progressColor: primaryColor,
                                  backgroundColor: progressColor,
                                  barRadius: const Radius.circular(100),
                                  lineHeight: 10,
                                  percent: count / (challenge?.totalDay ?? 0),
                                  padding: EdgeInsets.zero,
                                ),
                                40.gapSpace(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonImageStackWidget(
                                      participateList:
                                          challenge?.participateList ?? [],
                                    ),
                                    Text(
                                      ((challenge?.isChallengeComplete ?? 0) ==
                                              1)
                                          ? isYouWin
                                              ? LocaleKeys.you_win.tr()
                                              : LocaleKeys.you_lost.tr()
                                          : "${challenge?.currentDay ?? 0}/${challenge?.totalDay ?? 0} ${LocaleKeys.days.tr()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.avenirNextMedium,
                                        color:
                                            ((challenge?.isChallengeComplete ??
                                                        0) ==
                                                    1)
                                                ? isYouWin
                                                    ? acceptColor
                                                    : rejectColor
                                                : primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (state.isPaginationLoader) &&
                            (index == (state.challengeModelList.length - 1)),
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
