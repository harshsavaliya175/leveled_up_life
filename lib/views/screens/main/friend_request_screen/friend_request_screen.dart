import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/friend_model/friend_model.dart';
import 'package:leveled_up_life/views/screens/main/friend_request_screen/bloc/friend_request_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_floating_action_button.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class FriendRequestScreen extends StatelessWidget {
  FriendRequestScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<FriendRequestCubit>().loadMoreFriendRequestData();
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
          title: LocaleKeys.friend_request.tr(),
          displayLeading: true,
        ),
      ),
      backgroundColor: primaryColor,
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
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
            12.gapSpace(),
            BlocConsumer<FriendRequestCubit, FriendRequestState>(
              listener: (BuildContext context, FriendRequestState state) {
                if (state.message.isNotEmpty) {
                  context.showAppSnackBar(message: state.message);
                }
                if (state.isForceLogout) {
                  context.forceLogout();
                }
              },
              builder: (BuildContext context, FriendRequestState state) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      context
                          .read<FriendRequestCubit>()
                          .getFriendRequestList(isLoading: false);
                    },
                    backgroundColor: primaryColor,
                    color: Colors.white,
                    child: state.friendRequestModelList.isEmpty
                        ? Center(
                            child: Text(
                              LocaleKeys.no_request_data.tr(),
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemCount: state.friendRequestModelList.length,
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 20,
                              right: 20,
                              bottom: 32,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return 12.gapSpace();
                            },
                            itemBuilder: (BuildContext context, int index) {
                              FriendModel? requestModel =
                                  state.friendRequestModelList[index];
                              return Column(
                                children: [
                                  Container(
                                    height: 82,
                                    width: size.width,
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                      color: coolOneColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: AppNetworkImage(
                                            imagePath: (requestModel
                                                        ?.userProfilePhoto
                                                        ?.isNotEmpty ??
                                                    false)
                                                ? profileImagePath +
                                                    requestModel!
                                                        .userProfilePhoto!
                                                : '',
                                            errorWidget: Assets
                                                .images.imgPlaceUser
                                                .image(
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50,
                                            ),
                                            loadingBuilderWidth: 50,
                                            loadingBuilderHeight: 50,
                                            imageHeight: 50,
                                            imageWidth: 50,
                                          ),
                                        ),
                                        12.gapSpace(),
                                        Expanded(
                                          child: Text(
                                            state.friendRequestModelList[index]
                                                    ?.userName ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: primaryColor,
                                              height: 0,
                                              fontFamily:
                                                  FontFamily.avenirNextMedium,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 28,
                                          width: 28,
                                          child: AppFloatingActionButton(
                                            heroTag: 'accept $index',
                                            mini: true,
                                            onPressed: () async {
                                              bool isAccept = await context
                                                  .read<FriendRequestCubit>()
                                                  .removeOrAcceptFriend(
                                                    type: accept,
                                                    oppUserToken: requestModel
                                                            ?.userToken ??
                                                        '',
                                                  );
                                              if (isAccept) {
                                                context
                                                    .read<FriendRequestCubit>()
                                                    .removeDataWithOutApi(
                                                        index);
                                              }
                                            },
                                            elevation: 0,
                                            backgroundColor: primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: const BorderSide(
                                                  color: primaryColor),
                                            ),
                                            child: const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        16.gapSpace(),
                                        SizedBox(
                                          height: 28,
                                          width: 28,
                                          child: AppFloatingActionButton(
                                            heroTag: 'reject $index',
                                            mini: true,
                                            onPressed: () async {
                                              bool isReject = await context
                                                  .read<FriendRequestCubit>()
                                                  .removeOrAcceptFriend(
                                                    type: reject,
                                                    oppUserToken: requestModel
                                                            ?.userToken ??
                                                        '',
                                                  );
                                              if (isReject) {
                                                context
                                                    .read<FriendRequestCubit>()
                                                    .removeDataWithOutApi(
                                                        index);
                                              }
                                            },
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: const BorderSide(
                                                  color: primaryColor),
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: (state.isPaginationLoader) &&
                                        (index ==
                                            (state.friendRequestModelList
                                                    .length -
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
