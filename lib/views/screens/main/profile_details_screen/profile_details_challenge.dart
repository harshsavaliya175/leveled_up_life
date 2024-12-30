import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';
import 'package:leveled_up_life/models/response_model/participate_model/participate_model.dart';
import 'package:leveled_up_life/models/response_model/search_friend_model/search_friend_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/bloc/challenge_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/bloc/profile_details_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_image_stack_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileDetailsChallenge extends StatelessWidget {
  final SlidingUpPanelController panelController;
  final ScrollController scrollController;

  final SearchFriendModel? searchFriendModel;

  const ProfileDetailsChallenge({
    super.key,
    required this.panelController,
    required this.scrollController,
    required this.searchFriendModel,
  });

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    String? userToken = preferences.getString(SharedPreference.userToken);
    Size size = context.getScreenSize;
    return SlidingUpPanelWidget(
      controlHeight: (size.height * 0.50),
      anchor: 0.50,
      panelController: panelController,
      onTap: () {
        if (SlidingUpPanelStatus.expanded == panelController.status) {
          panelController.collapse();
        } else {
          panelController.expand();
        }
      },
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            11.gapSpace(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                LocaleKeys.challenges.tr(),
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontFamily: FontFamily.avenirNextDemi,
                ),
              ),
            ),
            20.gapSpace(),
            const Divider(color: dividerColor, thickness: 1, height: 0),
            BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
              builder: (BuildContext context, ProfileDetailsState state) {
                return Flexible(
                  child: state.challengeModelList.isEmpty
                      ? Center(
                          child: Text(
                            LocaleKeys.no_challenge_data.tr(),
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.challengeModelList.length,
                          shrinkWrap: true,
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 32),
                          separatorBuilder: (BuildContext context, int index) {
                            return 12.gapSpace();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            ChallengeModel? challenge =
                                state.challengeModelList[index];

                            bool isCurrentUserWin = false;
                            int count = 0;
                            challenge?.participateList?.forEach(
                              (ParticipateModel element) {
                                if ((searchFriendModel?.userToken ?? '') ==
                                    element.userToken) {
                                  count = element.count ?? 0;
                                  if (element.count == challenge?.totalDay) {
                                    isCurrentUserWin = true;
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
                                      List<ParticipateModel>?
                                          participateModelList =
                                          challenge?.participateList;
                                      List<ParticipateModel>
                                          participateModelListNew = [];
                                      participateModelListNew
                                          .addAll(participateModelList ?? []);
                                      int idx =
                                          participateModelListNew.indexWhere(
                                        (ParticipateModel element) {
                                          return element.userToken == userToken;
                                        },
                                      );
                                      if (idx != -1) {
                                        ParticipateModel participateModel =
                                            participateModelListNew[idx];
                                        participateModelListNew.removeAt(idx);
                                        participateModelListNew.insert(
                                            0, participateModel);
                                      }
                                      // ParticipateModel participateModel =
                                      //     participateModelListNew[idx];
                                      // participateModelListNew.removeAt(idx);
                                      // participateModelListNew.insert(
                                      //     0, participateModel);

                                      challenge = challenge?.copyWith(
                                        participateList:
                                            participateModelListNew,
                                      );

                                      context
                                          .read<ChallengeDetailsCubit>()
                                          .changeData(
                                              challengeModel: challenge);
                                      context
                                          .pushNamed(AppRoutes.challengeDetail,
                                              extra: searchFriendModel
                                                      ?.userToken ??
                                                  '')
                                          .then(
                                        (value) {
                                          if (value != null) {
                                            List<ChallengeModel?> challenges =
                                                state.challengeModelList;
                                            List<ChallengeModel?>
                                                challengesNew = [];
                                            challengesNew.addAll(challenges);
                                            challengesNew[index] =
                                                value as ChallengeModel;
                                            context
                                                .read<ProfileDetailsCubit>()
                                                .changeData(
                                                    challengeModelList:
                                                        challengesNew);
                                          }
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            challenge?.challengeName ?? '',
                                            style: const TextStyle(
                                              color: primaryColor,
                                              fontSize: 20,
                                              fontFamily:
                                                  FontFamily.avenirNextMedium,
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
                                            barRadius:
                                                const Radius.circular(100),
                                            lineHeight: 10,
                                            percent: count /
                                                (challenge?.totalDay ?? 0),
                                            padding: EdgeInsets.zero,
                                          ),
                                          40.gapSpace(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonImageStackWidget(
                                                participateList: challenge
                                                        ?.participateList ??
                                                    [],
                                              ),
                                              Text(
                                                ((challenge?.isChallengeComplete ??
                                                            0) ==
                                                        1)
                                                    ? isCurrentUserWin
                                                        ? LocaleKeys.winner.tr()
                                                        : LocaleKeys.loser.tr()
                                                    : "${challenge?.currentDay ?? 0}/${challenge?.totalDay ?? 0} ${LocaleKeys.days.tr()}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: FontFamily
                                                      .avenirNextMedium,
                                                  color:
                                                      ((challenge?.isChallengeComplete ??
                                                                  0) ==
                                                              1)
                                                          ? isCurrentUserWin
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
                                      (index ==
                                          (state.challengeModelList.length -
                                              1)),
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
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
