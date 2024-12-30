import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_model/challenge_model.dart';
import 'package:leveled_up_life/models/response_model/challenge_task_model/challenge_task_model.dart';
import 'package:leveled_up_life/models/response_model/participate_model/participate_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/bloc/challenge_details_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_check_box.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';

class ChallengeDetailData extends StatelessWidget {
  final String? selectedUserToken;

  const ChallengeDetailData({super.key, required this.selectedUserToken});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    String? userToken = preferences.getString(SharedPreference.userToken);
    Size size = context.getScreenSize;
    return BlocConsumer<ChallengeDetailsCubit, ChallengeDetailsState>(
      listener: (BuildContext context, ChallengeDetailsState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
      },
      builder: (BuildContext context, ChallengeDetailsState state) {
        bool isCurrentUser = false;
        state.challengeModel?.participateList?.forEach(
          (ParticipateModel element) {
            if (userToken == element.userToken) {
              isCurrentUser = true;
            }
          },
        );
        return Column(
          children: [
            12.gapSpace(),
            Center(
              child: Container(
                height: 5,
                width: 70,
                decoration: BoxDecoration(
                  color: bottomSheetHandleColor,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
            16.gapSpace(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      state.challengeModel?.challengeName ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: FontFamily.avenirNextDemi,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  if (state.challengeModel?.isChallengeComplete == 0)
                    Text(
                      "${LocaleKeys.day.tr()} ${state.challengeModel?.currentDay ?? 0}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontFamily: FontFamily.avenirNextDemi,
                      ),
                    ).paddingOnly(left: 5),
                ],
              ),
            ),
            20.gapSpace(),
            const Divider(thickness: 1, color: dividerColor, height: 0),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  20.gapSpace(),
                  ListView.separated(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        state.challengeModel?.challengeTaskList?.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) =>
                        12.gapSpace(),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          color: coolFiftyColor,
                          child: InkWell(
                            splashColor: acceptColor.withOpacity(0.5),
                            onTap: () async {
                              if (state
                                          .challengeModel
                                          ?.challengeTaskList?[index]
                                          .isComplete ==
                                      0 &&
                                  isCurrentUser) {
                                bool isChallengeComplete = await context
                                    .read<ChallengeDetailsCubit>()
                                    .challengeComplete(
                                      challengeId:
                                          state.challengeModel?.challengeId ??
                                              0,
                                      challengeTaskId: state
                                              .challengeModel
                                              ?.challengeTaskList?[index]
                                              .challengeTaskId ??
                                          0,
                                    );
                                if (isChallengeComplete) {
                                  List<ParticipateModel>? participateModelList =
                                      state.challengeModel?.participateList;
                                  List<ParticipateModel>
                                      participateModelListNew = [];
                                  participateModelListNew
                                      .addAll(participateModelList ?? []);
                                  ParticipateModel participateModel =
                                      participateModelListNew[0];

                                  List<ChallengeTaskModel>?
                                      challengeTaskModelList =
                                      state.challengeModel?.challengeTaskList;
                                  List<ChallengeTaskModel>
                                      challengeTaskModelListNew = [];
                                  challengeTaskModelListNew
                                      .addAll(challengeTaskModelList ?? []);
                                  ChallengeTaskModel challengeTaskModel =
                                      challengeTaskModelListNew[index];
                                  challengeTaskModel = challengeTaskModel
                                      .copyWith(isComplete: 1);
                                  challengeTaskModelListNew[index] =
                                      challengeTaskModel;
                                  bool isAllTaskComplete = true;

                                  for (ChallengeTaskModel task
                                      in challengeTaskModelListNew) {
                                    if (task.isComplete == 0) {
                                      isAllTaskComplete = false;
                                      break;
                                    }
                                  }

                                  if (isAllTaskComplete) {
                                    participateModel =
                                        participateModel.copyWith(
                                      count: (participateModel.count ?? 0) + 1,
                                    );
                                  }

                                  participateModelListNew[0] = participateModel;
                                  print(
                                      "----------------------------------> is app task complete --> $isAllTaskComplete");
                                  ChallengeModel? challengeModel =
                                      state.challengeModel;
                                  challengeModel = challengeModel?.copyWith(
                                    participateList: participateModelListNew,
                                    challengeTaskList:
                                        challengeTaskModelListNew,
                                    isTodayChallengeComplete:
                                        isAllTaskComplete ? 1 : 0,
                                  );
                                  context
                                      .read<ChallengeDetailsCubit>()
                                      .changeData(
                                          challengeModel: challengeModel);
                                }
                              }
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 56,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: primaryColor, width: 6),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state
                                            .challengeModel
                                            ?.challengeTaskList?[index]
                                            .challengeTaskName ??
                                        '',
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontFamily: FontFamily.avenirNextMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (state.challengeModel
                                              ?.isChallengeComplete ==
                                          0 &&
                                      isCurrentUser)
                                    AppCheckBox(
                                      checkBoxValue: state
                                              .challengeModel
                                              ?.challengeTaskList?[index]
                                              .isComplete ==
                                          1,
                                      onChanged: (bool? value) async {
                                        if (state
                                                    .challengeModel
                                                    ?.challengeTaskList?[index]
                                                    .isComplete ==
                                                0 &&
                                            isCurrentUser) {
                                          bool isChallengeComplete =
                                              await context
                                                  .read<ChallengeDetailsCubit>()
                                                  .challengeComplete(
                                                    challengeId: state
                                                            .challengeModel
                                                            ?.challengeId ??
                                                        0,
                                                    challengeTaskId: state
                                                            .challengeModel
                                                            ?.challengeTaskList?[
                                                                index]
                                                            .challengeTaskId ??
                                                        0,
                                                  );
                                          if (isChallengeComplete) {
                                            List<ParticipateModel>?
                                                participateModelList = state
                                                    .challengeModel
                                                    ?.participateList;
                                            List<ParticipateModel>
                                                participateModelListNew = [];
                                            participateModelListNew.addAll(
                                                participateModelList ?? []);
                                            ParticipateModel participateModel =
                                                participateModelListNew[0];

                                            List<ChallengeTaskModel>?
                                                challengeTaskModelList = state
                                                    .challengeModel
                                                    ?.challengeTaskList;
                                            List<ChallengeTaskModel>
                                                challengeTaskModelListNew = [];
                                            challengeTaskModelListNew.addAll(
                                                challengeTaskModelList ?? []);
                                            ChallengeTaskModel
                                                challengeTaskModel =
                                                challengeTaskModelListNew[
                                                    index];
                                            challengeTaskModel =
                                                challengeTaskModel.copyWith(
                                                    isComplete: 1);
                                            challengeTaskModelListNew[index] =
                                                challengeTaskModel;
                                            bool isAllTaskComplete = true;

                                            for (ChallengeTaskModel task
                                                in challengeTaskModelList ??
                                                    []) {
                                              if (task.isComplete == 0) {
                                                isAllTaskComplete = false;
                                                break;
                                              }
                                            }

                                            if (isAllTaskComplete) {
                                              participateModel =
                                                  participateModel.copyWith(
                                                count:
                                                    (participateModel.count ??
                                                            0) +
                                                        1,
                                              );
                                            }

                                            participateModelListNew[0] =
                                                participateModel;

                                            ChallengeModel? challengeModel =
                                                state.challengeModel;
                                            challengeModel =
                                                challengeModel?.copyWith(
                                              participateList:
                                                  participateModelListNew,
                                              challengeTaskList:
                                                  challengeTaskModelListNew,
                                              isTodayChallengeComplete:
                                                  isAllTaskComplete ? 1 : 0,
                                            );
                                            context
                                                .read<ChallengeDetailsCubit>()
                                                .changeData(
                                                    challengeModel:
                                                        challengeModel);
                                          }
                                        }
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  20.gapSpace(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "${LocaleKeys.participate.tr()} (${(state.challengeModel?.participateList?.length) ?? 0})",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.avenirNextMedium,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 32),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        state.challengeModel?.participateList?.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) =>
                        12.gapSpace(),
                    itemBuilder: (BuildContext context, int index) {
                      ParticipateModel? participateModel =
                          state.challengeModel?.participateList?[index];
                      return Container(
                        height: 72,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: coolFiftyColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.only(left: 16),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: (participateModel
                                          ?.userProfilePhoto?.isNotEmpty ??
                                      false)
                                  ? AppNetworkImage(
                                      imagePath: profileImagePath +
                                          (participateModel!.userProfilePhoto!),
                                      errorWidget:
                                          Assets.images.imgPlaceUser.image(
                                        fit: BoxFit.cover,
                                        height: 40,
                                        width: 40,
                                      ),
                                      loadingBuilderWidth: 40,
                                      loadingBuilderHeight: 40,
                                      imageHeight: 40,
                                      imageWidth: 40,
                                    )
                                  : Assets.images.imgPlaceUser.image(
                                      fit: BoxFit.cover,
                                      height: 40,
                                      width: 40,
                                    ),
                            ),
                            12.gapSpace(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${participateModel?.userName ?? ''} ${participateModel?.userToken == (userToken ?? '') ? '(you)' : ''}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: FontFamily.avenirNextMedium,
                                      color: primaryColor,
                                    ),
                                  ),
                                  4.gapSpace(),
                                  Text(
                                    "${participateModel?.count}/${state.challengeModel?.totalDay}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (state.challengeModel?.isChallengeComplete == 1)
                              Text(
                                participateModel?.count ==
                                        state.challengeModel?.totalDay
                                    ? participateModel?.userToken ==
                                            (userToken ?? '')
                                        ? LocaleKeys.you_win.tr()
                                        : LocaleKeys.winner.tr()
                                    : participateModel?.userToken ==
                                            (userToken ?? '')
                                        ? LocaleKeys.you_lost.tr()
                                        : participateModel?.userToken ==
                                                (selectedUserToken)
                                            ? LocaleKeys.loser.tr()
                                            : '',
                                style: TextStyle(
                                  color: participateModel?.count ==
                                          state.challengeModel?.totalDay
                                      ? acceptColor
                                      : rejectColor,
                                ),
                              ),
                            8.gapSpace(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
