// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/thirty_days_data_model/thirty_days_data_model.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/thirty_days_challenges_data.dart';
import 'package:leveled_up_life/views/widgets/app_blur_icon_button.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';
import 'package:leveled_up_life/views/widgets/thirty_days_challenges_bottom_sheet_widget.dart';

class ThirtyDaysChallengesScreen extends StatefulWidget {
  const ThirtyDaysChallengesScreen({super.key});

  @override
  State<ThirtyDaysChallengesScreen> createState() =>
      _ThirtyDaysChallengesScreenState();
}

class _ThirtyDaysChallengesScreenState
    extends State<ThirtyDaysChallengesScreen> {
  final ScrollController scrollController = ScrollController();

  void scrollToDate(int date) {
    date -= 1;
    if (date != -1) {
      scrollController.animateTo(
        date * 50.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    context.read<ThirtyDaysChallengesCubit>().initData();
    context.read<ThirtyDaysChallengesCubit>().getChallengeRequestList().then(
      (value) {
        int day = context.read<ThirtyDaysChallengesCubit>().state.dayIndex;
        WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
          scrollToDate(day);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          title: LocaleKeys.challenges.tr(),
          displayLeading: true,
          actionWidget: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: AppBlurIconButton(
                onTap: () {
                  context
                      .read<ThirtyDaysChallengesCubit>()
                      .getSummaryChart(chartSelectedIndex: 0);
                  context.showAppBottomSheet(
                    contentWidget:
                        const ThirtyDaysChallengesBottomSheetWidget(),
                  );
                },
                child: Assets.icons.ic30DaysChallenges.svg(
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ).paddingOnly(right: 20),
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.gapSpace(),
          Text(
            LocaleKeys.thirty_days.tr(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: FontFamily.avenirNextDemi,
            ),
          ).paddingSymmetric(horizontal: 20),
          16.gapSpace(),
          BlocBuilder<ThirtyDaysChallengesCubit, ThirtyDaysChallengesState>(
            builder: (BuildContext context, ThirtyDaysChallengesState state) {
              ThirtyDaysDataModel? thirtyDaysDataModel =
                  state.thirtyDaysDataModel;
              return SizedBox(
                height: 62,
                child: ListView.separated(
                  itemCount: 30,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (BuildContext context, int index) =>
                      10.gapSpace(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 62,
                      width: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ((thirtyDaysDataModel?.days ?? 1) == (index + 1))
                            ? buttonColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.day.tr(),
                            style: TextStyle(
                              fontSize: 12,
                              color: (state.dayIndex) > (index + 1)
                                  ? Colors.white.withOpacity(0.4)
                                  : Colors.white,
                            ),
                          ),
                          4.gapSpace(),
                          Text(
                            "${index + 1}".toString().padLeft(2, "0"),
                            style: TextStyle(
                              fontSize: 16,
                              color: (state.dayIndex) > (index + 1)
                                  ? Colors.white.withOpacity(0.4)
                                  : Colors.white,
                              fontFamily: FontFamily.avenirNextMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          28.gapSpace(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
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
                    12.gapSpace(),
                    Text(
                      LocaleKeys.leveled_up_life.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontFamily: FontFamily.avenirNextBold,
                      ),
                    ).paddingOnly(left: 20),
                    20.gapSpace(),
                    const Divider(color: dividerColor, thickness: 1, height: 0),
                    20.gapSpace(),
                    BlocBuilder<ThirtyDaysChallengesCubit,
                        ThirtyDaysChallengesState>(
                      buildWhen: (ThirtyDaysChallengesState previous,
                          ThirtyDaysChallengesState current) {
                        return previous.selectedIndex != current.selectedIndex;
                      },
                      builder: (BuildContext context,
                          ThirtyDaysChallengesState state) {
                        return Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                onTap: () {
                                  context
                                      .read<ThirtyDaysChallengesCubit>()
                                      .getChallengeRequestList(index: 0);
                                },
                                buttonBorderRadius: 8,
                                appButtonColor: state.selectedIndex == 0
                                    ? buttonColor
                                    : Colors.transparent,
                                borderSide: state.selectedIndex == 0
                                    ? BorderSide.none
                                    : const BorderSide(
                                        color: coolOneColor,
                                        width: 1,
                                      ),
                                child: Text(
                                  LocaleKeys.daily.tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: state.selectedIndex == 0
                                        ? Colors.white
                                        : coolFourColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                  ),
                                ),
                              ),
                            ),
                            16.gapSpace(),
                            Expanded(
                              child: AppButton(
                                onTap: () {
                                  context
                                      .read<ThirtyDaysChallengesCubit>()
                                      .getChallengeRequestList(index: 1);
                                },
                                buttonBorderRadius: 8,
                                appButtonColor: state.selectedIndex == 1
                                    ? buttonColor
                                    : Colors.transparent,
                                borderSide: state.selectedIndex == 1
                                    ? BorderSide.none
                                    : const BorderSide(
                                        color: coolOneColor,
                                        width: 1,
                                      ),
                                child: Text(
                                  LocaleKeys.weekly.tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: state.selectedIndex == 1
                                        ? Colors.white
                                        : coolFourColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                  ),
                                ),
                              ),
                            ),
                            16.gapSpace(),
                            Expanded(
                              child: AppButton(
                                onTap: () {
                                  context
                                      .read<ThirtyDaysChallengesCubit>()
                                      .getChallengeRequestList(index: 2);
                                },
                                buttonBorderRadius: 8,
                                appButtonColor: state.selectedIndex == 2
                                    ? buttonColor
                                    : Colors.transparent,
                                borderSide: state.selectedIndex == 2
                                    ? BorderSide.none
                                    : const BorderSide(
                                        color: coolOneColor,
                                        width: 1,
                                      ),
                                child: Text(
                                  LocaleKeys.monthly.tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: state.selectedIndex == 2
                                        ? Colors.white
                                        : coolFourColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).paddingSymmetric(horizontal: 20),
                    16.gapSpace(),
                    BlocBuilder<ThirtyDaysChallengesCubit,
                        ThirtyDaysChallengesState>(
                      buildWhen: (ThirtyDaysChallengesState previous,
                          ThirtyDaysChallengesState current) {
                        return previous.selectedIndex != current.selectedIndex;
                      },
                      builder: (BuildContext context,
                          ThirtyDaysChallengesState state) {
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: LocaleKeys.note_com.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: lightGreyColor,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " ${state.selectedIndex == 0 ? LocaleKeys.these_are_all_challenges_for_daily_productivity.tr() : state.selectedIndex == 1 ? LocaleKeys.these_are_all_challenges_for_weekly_productivity.tr() : LocaleKeys.choose_one_experience_from_the_list_below.tr()}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: lightGreyColor,
                                  fontFamily: FontFamily.avenirNextRegular,
                                ),
                              ),
                            ],
                          ),
                        ).paddingSymmetric(horizontal: 20);
                      },
                    ),
                    16.gapSpace(),
                    const ThirtyDaysChallengesData()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
