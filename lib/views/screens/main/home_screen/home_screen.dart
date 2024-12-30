import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/core/utils/push_notification_utils.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/bloc/affirmation_cubit.dart';
import 'package:leveled_up_life/views/screens/main/bible_screen/bloc/bible_screen_cubit.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/bloc/grateful_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/app_drawer.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/bloc/notification_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_blur_icon_button.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_floating_action_button.dart';
import 'package:leveled_up_life/views/widgets/task_check_verify_dialog.dart';
import 'package:leveled_up_life/views/widgets/thirty_days_bible_verse_bottom_sheet_widget.dart';
import 'package:leveled_up_life/views/widgets/verse_share_check_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = context.getScreenSize;
    PageController pageController =
        PageController(viewportFraction: 0.9, keepPage: true);
    si.get<NotificationUtils>().init();
    // context.read<SubscriptionCubit>().getReceiptStatus();
    UserModel? userData = preferences.getUserModel();

    if (Platform.isIOS) {
      bool isSubscriptionActivated =
          (userData?.isSubscriptionActivated ?? 0) == 1 ||
              (userData?.isAdmin ?? 0) == 1;
      if (isSubscriptionActivated) {
        isPurchase = (userData?.isAndroidPurchased ?? 0) == 0;
      }
    }

    if (isPurchase) {
      log("-------------- *************** SUBSCRIPTION IS ACTIVATED *************** --------------");
    } else {
      log("-------------- *************** SUBSCRIPTION IS NOT ACTIVATED *************** --------------");
    }
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 5, bottom: 5),
          child: AppBlurIconButton(
            onTap: () {
              context.read<HomeCubit>().getFriendsCount();
              scaffoldKey.currentState!.openDrawer();
            },
            child: Assets.icons.icMenu.svg(
              height: 13,
              width: 18,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (BuildContext context, HomeState state) {
              if (state.message.isNotEmpty) {
                context.showAppSnackBar(message: state.message);
              }
              if (state.isForceLogout) {
                context.forceLogout();
              }
            },
            builder: (BuildContext context, HomeState state) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: AppBlurIconButton(
                  onTap: () {
                    context.read<NotificationCubit>().getNotificationList();
                    context.pushNamed(AppRoutes.notification).then(
                      (value) {
                        context.read<HomeCubit>().getBadge();
                      },
                    );

                    // context.showAppDialog(
                    //   barrierDismissible: false,
                    //   contentWidget: const TaskCheckVerifyDialog(),
                    // );
                  },
                  child: Stack(
                    alignment: const Alignment(0.7, -0.7),
                    children: [
                      Assets.icons.icNotification.svg(
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      if (state.badge > 0)
                        Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: notificationIndicatorColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          20.gapSpace(),
        ],
      ),
      drawer: const DrawerScreen(),
      drawerScrimColor: Colors.black.withOpacity(0.5),
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Assets.images.imgAuthBackground.image(
            height: size.height / 3.2,
            width: size.width,
            alignment: Alignment.topCenter,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, HomeState state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (size.height * 0.14).gapSpace(),
                        AutoSizeText(
                          state.homeDisplayBibleVerse?.title ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: FontFamily.avenirNextMedium,
                          ),
                        ),
                        24.gapSpace(),
                        Visibility(
                          visible:
                              state.homeDisplayBibleVerse?.title.isNotEmpty ??
                                  false,
                          child: Column(
                            children: [
                              AppButton(
                                buttonBorderRadius: 8,
                                onTap: () async {
                                  String text =
                                      "${state.homeDisplayBibleVerse!.title}\n\n$storeLink";
                                  await SharePlusUtil().shareTextOrImage(
                                    shareText: text,
                                    shareImageUrl: '',
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      LocaleKeys.share.tr(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.avenirNextMedium,
                                        color: Colors.white,
                                      ),
                                    ),
                                    8.gapSpace(),
                                    Assets.icons.icShare.svg(
                                      height: 16,
                                      width: 13,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ).paddingSymmetric(
                                  horizontal: 28,
                                  vertical: 12,
                                ),
                              ),
                              40.gapSpace(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.gapSpace(),
                        SizedBox(
                          height: 170,
                          child: PageView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeComponent.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: index == 1
                                    ? null
                                    : const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      homeComponent[index][bgImagePath],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    gradient: index == 0
                                        ? null
                                        : LinearGradient(
                                            colors: [
                                              primaryColor.withOpacity(1),
                                              primaryColor.withOpacity(0.1),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                homeComponent[index][title],
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontFamily:
                                                      FontFamily.avenirNextDemi,
                                                ),
                                              ),
                                              Text(
                                                homeComponent[index][subTitle],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: coolFourColor,
                                                ),
                                              ),
                                              AppButton(
                                                onTap: () {
                                                  if (index == 0) {
                                                    if (isPurchase) {
                                                      context.pushNamed(AppRoutes
                                                          .thirtyDaysChallenges);
                                                      Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100),
                                                        () {
                                                          UserModel? user =
                                                              preferences
                                                                  .getUserModel();
                                                          if ((user?.isChallenge ??
                                                                  1) ==
                                                              1) {
                                                            context
                                                                .showAppDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              contentWidget:
                                                                  const TaskCheckVerifyDialog(),
                                                            );
                                                          }
                                                        },
                                                      );
                                                    } else {
                                                      // context.showAppSnackBar(
                                                      //     message: LocaleKeys
                                                      //         .subscriptionReqTxt
                                                      //         .tr());
                                                      context
                                                          .gotoSubscriptionScreen();
                                                    }
                                                  } else if (index == 1) {
                                                    context
                                                        .read<HomeCubit>()
                                                        .getBibleVerse(true);
                                                    context
                                                        .showAppBottomSheet(
                                                      contentWidget:
                                                          const ThirtyDaysBibleVerseBottomSheetWidget(),
                                                    )
                                                        .then(
                                                      (dynamic value) {
                                                        context
                                                            .read<HomeCubit>()
                                                            .getChallengeDay();
                                                        print(
                                                            "------ close bottom sheet ------");
                                                      },
                                                    );
                                                    Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                        UserModel? user =
                                                            preferences
                                                                .getUserModel();
                                                        if ((user?.isBibleVerse ??
                                                                0) ==
                                                            1) {
                                                          context.showAppDialog(
                                                            barrierDismissible:
                                                                false,
                                                            contentWidget:
                                                                const VerseShareCheckDialog(),
                                                          );
                                                        }
                                                      },
                                                    );
                                                  }
                                                },
                                                buttonBorderRadius: 4,
                                                child: Text(
                                                  homeComponent[index]
                                                      [buttonText],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: FontFamily
                                                        .avenirNextDemi,
                                                  ),
                                                ).paddingSymmetric(
                                                  horizontal:
                                                      index == 0 ? 24 : 34,
                                                  vertical: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        if (index == 0)
                                          BlocBuilder<HomeCubit, HomeState>(
                                            builder: (BuildContext context,
                                                HomeState state) {
                                              return CircularPercentIndicator(
                                                radius: 40,
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                progressColor: buttonColor,
                                                backgroundColor: Colors.white,
                                                lineWidth: 12,
                                                percent: state
                                                        .thirtyDayChallengeDay /
                                                    30,
                                                center: RichText(
                                                  text: TextSpan(
                                                    text:
                                                        "${state.thirtyDayChallengeDay}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily: FontFamily
                                                          .avenirNextDemi,
                                                    ),
                                                    children: const [
                                                      TextSpan(
                                                        text: '/',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontFamily: FontFamily
                                                              .avenirNextDemi,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '30',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white,
                                                          fontFamily: FontFamily
                                                              .avenirNextDemi,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ).paddingOnly(left: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        8.gapSpace(),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: primaryColor,
                            dotColor: coolFourColor,
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 4,
                          ),
                        ),
                        16.gapSpace(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 197,
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 16,
                                          right: 16,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.grateful.tr(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontFamily:
                                                    FontFamily.avenirNextDemi,
                                              ),
                                            ),
                                            const Gap(10),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                LocaleKeys
                                                    .add_what_you_are_grateful_for
                                                    .tr(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: coolFourColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        right: -5,
                                        child: Container(
                                          height: 73,
                                          width: 73,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SizedBox(
                                            height: 62,
                                            width: 62,
                                            child: AppFloatingActionButton(
                                              heroTag: 'Grateful',
                                              onPressed: () {
                                                context
                                                    .read<GratefulCubit>()
                                                    .initData();
                                                context
                                                    .read<GratefulCubit>()
                                                    .getGratefulList(
                                                      date: DateFormat(
                                                              'yyyy-MM-dd')
                                                          .format(
                                                              DateTime.now()),
                                                    );
                                                context.pushNamed(
                                                    AppRoutes.grateful);
                                              },
                                              backgroundColor: buttonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(31),
                                              ),
                                              elevation: 0,
                                              child: const Icon(
                                                Icons.arrow_forward_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              16.gapSpace(),
                              Expanded(
                                child: Container(
                                  height: 197,
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 16,
                                          right: 16,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.affirmation.tr(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontFamily:
                                                    FontFamily.avenirNextDemi,
                                              ),
                                            ),
                                            const Gap(10),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                LocaleKeys.add_your_affirmation
                                                    .tr(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: coolFourColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        right: -5,
                                        child: Container(
                                          height: 73,
                                          width: 73,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SizedBox(
                                            height: 62,
                                            width: 62,
                                            child: AppFloatingActionButton(
                                              heroTag: 'Affirmation',
                                              onPressed: () {
                                                context
                                                    .read<AffirmationCubit>()
                                                    .initData();
                                                context
                                                    .read<AffirmationCubit>()
                                                    .getAffirmationList(
                                                      date: DateFormat(
                                                              'yyyy-MM-dd')
                                                          .format(
                                                        DateTime.now(),
                                                      ),
                                                    );
                                                context.pushNamed(
                                                    AppRoutes.affirmation);
                                              },
                                              backgroundColor: buttonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(31),
                                              ),
                                              elevation: 0,
                                              child: const Icon(
                                                Icons.arrow_forward_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.gapSpace(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 165,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.images.imgHolyBible.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    primaryColor.withOpacity(1),
                                    primaryColor.withOpacity(0.1),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.the_holy_bible.tr(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: FontFamily.avenirNextDemi,
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.reading_the_bible_every_day
                                            .tr(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: coolFourColor,
                                        ),
                                      ),
                                      AppButton(
                                        onTap: () {
                                          context
                                              .read<BibleScreenCubit>()
                                              .getAllBibleBooks();
                                          context.pushNamed(AppRoutes.bible);
                                        },
                                        buttonBorderRadius: 4,
                                        child: Text(
                                          LocaleKeys.read.tr(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                                FontFamily.avenirNextDemi,
                                          ),
                                        ).paddingSymmetric(
                                          horizontal: 34,
                                          vertical: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 20, vertical: 29),
                            ),
                          ),
                        ),
                        20.gapSpace(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
