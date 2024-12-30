import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/search_friend_model/search_friend_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/bloc/find_friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/bloc/profile_details_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/app_outline_button.dart';

class FriendListData extends StatelessWidget {
  final ScrollController controller;

  const FriendListData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    Size size = context.getScreenSize;
    String? userToken = preferences.getString(SharedPreference.userToken);
    return BlocConsumer<FindFriendCubit, FindFriendState>(
      listener: (BuildContext context, FindFriendState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, FindFriendState state) {
        return ListView.separated(
          controller: controller,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          itemCount: state.searchFriendModelList.length,
          separatorBuilder: (BuildContext context, int index) => 12.gapSpace(),
          itemBuilder: (BuildContext context, int index) {
            SearchFriendModel? searchFriend =
                state.searchFriendModelList[index];
            return Column(
              children: [
                Material(
                  color: coolOneColor,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      context
                          .read<ProfileDetailsCubit>()
                          .getProfileDetails(searchFriend?.userToken ?? '');
                      context
                          .read<ProfileDetailsCubit>()
                          .getChallengeList(searchFriend?.userToken ?? '');
                      context
                          .pushNamed(AppRoutes.profileDetails,
                              extra: searchFriend)
                          .then(
                        (value) {
                          if (value != null) {
                            List<SearchFriendModel?> friends =
                                state.searchFriendModelList;
                            List<SearchFriendModel?> friendsNew = [];
                            friendsNew.addAll(friends);
                            friendsNew[index] = value as SearchFriendModel;
                            context
                                .read<FindFriendCubit>()
                                .changeData(friends: friendsNew);
                          }
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: size.width,
                      height: 92,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: (searchFriend
                                        ?.userProfilePhoto?.isNotEmpty ??
                                    false)
                                ? AppNetworkImage(
                                    imagePath: profileImagePath +
                                        (searchFriend?.userProfilePhoto ?? ''),
                                    errorWidget:
                                        Assets.images.imgPlaceUser.image(
                                      fit: BoxFit.cover,
                                      height: 60,
                                      width: 60,
                                    ),
                                    loadingBuilderWidth: 60,
                                    loadingBuilderHeight: 60,
                                    imageHeight: 60,
                                    imageWidth: 60,
                                  )
                                : Assets.images.imgPlaceUser.image(
                                    fit: BoxFit.cover,
                                    height: 60,
                                    width: 60,
                                  ),
                          ),
                          12.gapSpace(),
                          Expanded(
                            child: Text(
                              searchFriend?.userName ?? '',
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                                fontFamily: FontFamily.avenirNextMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          5.gapSpace(),
                          if (searchFriend?.isAccept == null)
                            SizedBox(
                              height: 30,
                              child: AppButton(
                                onTap: () async {
                                  bool isSendRequest = await context
                                      .read<FindFriendCubit>()
                                      .sendFriendRequest(
                                          searchFriend?.userToken ?? '');

                                  if (isSendRequest) {
                                    context
                                        .read<FindFriendCubit>()
                                        .changeButton(
                                          index: index,
                                          isAccept: 0,
                                        );
                                  }
                                },
                                buttonBorderRadius: 4,
                                appButtonColor: primaryColor,
                                child: Text(
                                  LocaleKeys.request.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: coolOneColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                    height: 1,
                                  ),
                                ).paddingSymmetric(horizontal: 24, vertical: 8),
                              ),
                            )
                          else if (searchFriend?.isAccept == 1)
                            SizedBox(
                              height: 30,
                              child: AppOutlineButton(
                                onTap: () async {
                                  bool isRemove = await context
                                      .read<FindFriendCubit>()
                                      .removeAndAcceptFriend(
                                        oppUserToken:
                                            searchFriend?.userToken ?? '',
                                        type: reject,
                                      );
                                  if (isRemove) {
                                    context
                                        .read<FindFriendCubit>()
                                        .changeButton(
                                          index: index,
                                          isAccept: null,
                                        );
                                  }
                                },
                                buttonBorderRadius: 4,
                                child: Text(
                                  LocaleKeys.remove.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                    height: 1,
                                  ),
                                ).paddingSymmetric(horizontal: 24, vertical: 8),
                              ),
                            )
                          else if (searchFriend?.isAccept == 0 &&
                              searchFriend?.senderToken == userToken)
                            SizedBox(
                              height: 30,
                              child: AppOutlineButton(
                                onTap: () async {
                                  bool isReject = await context
                                      .read<FindFriendCubit>()
                                      .removeAndAcceptFriend(
                                        oppUserToken:
                                            searchFriend?.userToken ?? '',
                                        type: reject,
                                      );

                                  if (isReject) {
                                    context
                                        .read<FindFriendCubit>()
                                        .changeButton(
                                          index: index,
                                          isAccept: null,
                                        );
                                  }
                                },
                                buttonBorderRadius: 4,
                                child: Text(
                                  LocaleKeys.requested.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                    height: 1,
                                  ),
                                ).paddingSymmetric(horizontal: 24, vertical: 8),
                              ),
                            )
                          else
                            SizedBox(
                              height: 30,
                              child: AppOutlineButton(
                                onTap: () async {
                                  bool isSendRequest = await context
                                      .read<FindFriendCubit>()
                                      .removeAndAcceptFriend(
                                        type: accept,
                                        oppUserToken:
                                            searchFriend?.userToken ?? '',
                                      );
                                  if (isSendRequest) {
                                    context
                                        .read<FindFriendCubit>()
                                        .changeButton(
                                          index: index,
                                          isAccept: 1,
                                        );
                                  }
                                },
                                buttonBorderRadius: 4,
                                child: Text(
                                  LocaleKeys.accept.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                    height: 1,
                                  ),
                                ).paddingSymmetric(horizontal: 24, vertical: 8),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (state.isPaginationLoader) &&
                      (index == (state.searchFriendModelList.length - 1)),
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
