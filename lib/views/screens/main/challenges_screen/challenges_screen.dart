import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/bloc/challenge_request_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/bloc/challenges_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/challenges_data.dart';
import 'package:leveled_up_life/views/screens/main/create_new_challenge_screen/bloc/create_new_challenge_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_blur_icon_button.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<ChallengesCubit>().loadMoreChallengeData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    scrollControllerListener(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: false,
          actionWidget: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Stack(
                alignment: const Alignment(1.1, -1.2),
                children: [
                  AppBlurIconButton(
                    onTap: () {
                      context
                          .read<ChallengeRequestCubit>()
                          .getChallengeRequestList();
                      context.pushNamed(AppRoutes.challengeRequest).then(
                        (value) {
                          context
                              .read<ChallengesCubit>()
                              .getChallengeRequestCount();
                          context.read<ChallengesCubit>().getChallengeList();
                        },
                      );
                    },
                    child: Assets.icons.icChallenges.svg(
                      height: 18,
                      width: 21,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: badgeColor,
                      shape: BoxShape.circle,
                    ),
                    child: BlocBuilder<ChallengesCubit, ChallengesState>(
                      builder: (BuildContext context, ChallengesState state) {
                        return Text(
                          '${state.getChallengeRequestCount}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: FontFamily.avenirNextDemi,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            20.gapSpace(),
          ],
          title: LocaleKeys.custom_challenge.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: size.height,
              width: size.width,
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Column(
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
                    12.gapSpace(),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          context
                              .read<ChallengesCubit>()
                              .getChallengeList(isLoading: false);
                        },
                        backgroundColor: primaryColor,
                        color: Colors.white,
                        child: ChallengesData(controller: scrollController),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isPurchase) {
            context.read<CreateNewChallengeCubit>().initData();
            context.read<CreateNewChallengeCubit>().changeData(
              taskControllerList: [TextEditingController()],
            );
            context.pushNamed(AppRoutes.createChallenge);
          } else {
            // context.showAppSnackBar(
            //     message: LocaleKeys.subscriptionReqTxt.tr());
            context.gotoSubscriptionScreen();
          }
        },
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: buttonColor.withOpacity(0.2),
                offset: const Offset(0, 3),
                blurRadius: 15,
                spreadRadius: 4,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.add_rounded, size: 40),
        ),
      ),
    );
  }
}
