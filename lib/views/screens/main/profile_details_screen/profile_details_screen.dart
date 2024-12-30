import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/search_friend_model/search_friend_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/bloc/profile_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/profile_details_challenge.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ProfileDetailsScreen extends StatelessWidget {
  SearchFriendModel? searchFriendModel;

  ProfileDetailsScreen({super.key, required this.searchFriendModel});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context
              .read<ProfileDetailsCubit>()
              .loadMoreChallengeData(searchFriendModel?.userToken ?? '');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    String? userToken = preferences.getString(SharedPreference.userToken);
    scrollControllerListener(context);
    Size size = context.getScreenSize;
    SlidingUpPanelController panelController = SlidingUpPanelController();
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log('===>  $didPop');
        if (didPop) {
          return;
        }
        ProfileDetailsCubit profileDetailsCubit =
            context.read<ProfileDetailsCubit>();
        searchFriendModel = searchFriendModel?.copyWith(
          isAccept: profileDetailsCubit.state.profileModel?.isAccept,
          userName: profileDetailsCubit.state.profileModel?.userName,
          userToken: profileDetailsCubit.state.profileModel?.userToken,
          receiverToken: profileDetailsCubit.state.profileModel?.receiverToken,
          senderToken: profileDetailsCubit.state.profileModel?.senderToken,
          userProfilePhoto:
              profileDetailsCubit.state.profileModel?.userProfilePhoto,
          friendId: profileDetailsCubit.state.profileModel?.friendId,
        );
        context.pop(searchFriendModel);
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
                builder: (BuildContext context, ProfileDetailsState state) {
                  return CommonAppBar(
                    title: LocaleKeys.profile_details.tr(),
                    displayLeading: true,
                    onTap: () {
                      searchFriendModel = searchFriendModel?.copyWith(
                        isAccept: state.profileModel?.isAccept,
                        userName: state.profileModel?.userName,
                        userToken: state.profileModel?.userToken,
                        receiverToken: state.profileModel?.receiverToken,
                        senderToken: state.profileModel?.senderToken,
                        userProfilePhoto: state.profileModel?.userProfilePhoto,
                        friendId: state.profileModel?.friendId,
                      );
                      context.pop(searchFriendModel);
                    },
                  );
                },
              ),
            ),
            backgroundColor: primaryColor,
            body: BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
              builder: (BuildContext context, ProfileDetailsState state) {
                return SizedBox(
                  height: size.height * 0.48,
                  child: Center(
                    child: Column(
                      children: [
                        (size.height * 0.024).gapSpace(),
                        Container(
                          height: size.height * 0.14,
                          width: size.height * 0.14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: buttonColor, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(size.height * 0.07),
                            child: (state.profileModel?.userProfilePhoto
                                        ?.isNotEmpty ??
                                    false)
                                ? AppNetworkImage(
                                    imagePath: (state
                                                .profileModel
                                                ?.userProfilePhoto
                                                ?.isNotEmpty ??
                                            false)
                                        ? profileImagePath +
                                            state
                                                .profileModel!.userProfilePhoto!
                                        : '',
                                    errorWidget:
                                        Assets.images.imgPlaceUser.image(
                                      fit: BoxFit.cover,
                                      height: size.height * 0.14,
                                      width: size.height * 0.14,
                                    ),
                                    loadingBuilderWidth: size.height * 0.14,
                                    loadingBuilderHeight: size.height * 0.14,
                                    imageHeight: size.height * 0.14,
                                    imageWidth: size.height * 0.14,
                                  )
                                : Assets.images.imgPlaceUser.image(
                                    fit: BoxFit.cover,
                                    height: size.height * 0.14,
                                    width: size.height * 0.14,
                                  ),
                          ),
                        ),
                        (size.height * 0.02).gapSpace(),
                        Text(
                          state.profileModel?.userName ?? '',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: FontFamily.avenirNextDemi,
                          ),
                        ),
                        (size.height * 0.012).gapSpace(),
                        RichText(
                          text: TextSpan(
                            text: "${state.profileModel?.totalFriends ?? '0'}",
                            style: const TextStyle(
                              color: buttonColor,
                              fontSize: 24,
                              fontFamily: FontFamily.avenirNextDemi,
                            ),
                            children: [
                              TextSpan(
                                text: ' ${LocaleKeys.friends.tr()}',
                                style: const TextStyle(
                                  color: buttonColor,
                                  fontSize: 24,
                                  fontFamily: FontFamily.avenirNextRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        (size.height * 0.02).gapSpace(),
                        BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
                          builder: (BuildContext context,
                              ProfileDetailsState state) {
                            return AppButton(
                              onTap: () async {
                                if (state.profileModel?.isAccept == null) {
                                  bool isSendRequest = await context
                                      .read<ProfileDetailsCubit>()
                                      .sendFriendRequest(
                                          state.profileModel?.userToken ?? '');

                                  if (isSendRequest) {
                                    context
                                        .read<ProfileDetailsCubit>()
                                        .getProfileDetails(
                                            state.profileModel?.userToken ??
                                                '');
                                  }
                                } else if (state.profileModel?.isAccept == 1 ||
                                    (state.profileModel?.isAccept == 0 &&
                                        state.profileModel?.senderToken ==
                                            userToken)) {
                                  bool isRemove = await context
                                      .read<ProfileDetailsCubit>()
                                      .removeAndAcceptFriend(
                                        oppUserToken:
                                            state.profileModel?.userToken ?? '',
                                        type: reject,
                                      );
                                  if (isRemove) {
                                    context
                                        .read<ProfileDetailsCubit>()
                                        .getProfileDetails(
                                            state.profileModel?.userToken ??
                                                '');
                                  }
                                } else if (state.profileModel?.isAccept == 0 &&
                                    state.profileModel?.senderToken !=
                                        userToken) {
                                  bool isAccept = await context
                                      .read<ProfileDetailsCubit>()
                                      .removeAndAcceptFriend(
                                        oppUserToken:
                                            state.profileModel?.userToken ?? '',
                                        type: accept,
                                      );

                                  if (isAccept) {
                                    context
                                        .read<ProfileDetailsCubit>()
                                        .getProfileDetails(
                                            state.profileModel?.userToken ??
                                                '');
                                  }
                                }
                              },
                              appButtonColor: secondaryThreeColor,
                              fixedSize: WidgetStatePropertyAll(
                                  Size(size.width * 0.60, 44)),
                              child: Text(
                                state.profileModel?.isAccept == null
                                    ? LocaleKeys.request.tr()
                                    : state.profileModel?.isAccept == 1
                                        ? LocaleKeys.remove.tr()
                                        : state.profileModel?.isAccept == 0 &&
                                                state.profileModel
                                                        ?.senderToken ==
                                                    userToken
                                            ? LocaleKeys.requested.tr()
                                            : LocaleKeys.accept.tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ProfileDetailsChallenge(
            panelController: panelController,
            scrollController: scrollController,
            searchFriendModel: searchFriendModel,
          ),
        ],
      ),
    );
  }
}
