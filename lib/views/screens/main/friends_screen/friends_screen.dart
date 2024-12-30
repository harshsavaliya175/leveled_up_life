import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/friends_screen/bloc/friend_cubit.dart';
import 'package:leveled_up_life/views/widgets/alert_dialog_widget.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/app_text_button.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class FriendsScreen extends StatelessWidget {
  FriendsScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<FriendCubit>().loadMoreFriendData();
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
          title: LocaleKeys.friends.tr(),
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
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    context.read<FriendCubit>().getFriendList(isLoading: false);
                  },
                  child: BlocConsumer<FriendCubit, FriendState>(
                    listener: (BuildContext context, FriendState state) {
                      if (state.message.isNotEmpty) {
                        context.showAppSnackBar(message: state.message);
                      }
                    },
                    builder: (BuildContext context, FriendState state) {
                      return state.friendModelList.isEmpty
                          ? Center(
                              child: Text(
                                LocaleKeys.no_friends_data.tr(),
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : ListView.separated(
                              controller: scrollController,
                              itemCount: state.friendModelList.length,
                              padding: const EdgeInsets.only(
                                  top: 12, left: 20, right: 20, bottom: 32),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 12.gapSpace();
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 82,
                                      width: size.width,
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 16,
                                          bottom: 16,
                                          right: 6),
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
                                              imagePath: profileImagePath +
                                                  (state.friendModelList[index]
                                                          ?.userProfilePhoto ??
                                                      ''),
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
                                              state.friendModelList[index]
                                                      ?.userName ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: primaryColor,
                                                fontFamily:
                                                    FontFamily.avenirNextMedium,
                                              ),
                                            ),
                                          ),
                                          AppTextButton(
                                            text: LocaleKeys.remove.tr(),
                                            fontFamily:
                                                FontFamily.avenirNextMedium,
                                            textColor: redColor,
                                            onPressed: () async {
                                              context.showAppDialog(
                                                contentWidget:
                                                    AlertDialogWidget(
                                                  removeFriendText: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: LocaleKeys
                                                          .are_you_sure_you_want_to_remove
                                                          .tr(),
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: FontFamily
                                                            .avenirNextMedium,
                                                        color: lightBlackColor,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              ' ${state.friendModelList[index]?.userName ?? ''}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: FontFamily
                                                                .avenirNextBold,
                                                            color:
                                                                lightBlackColor,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: ' ?',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: FontFamily
                                                                .avenirNextMedium,
                                                            color:
                                                                lightBlackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    bool isRemoveFriend =
                                                        await context
                                                            .read<FriendCubit>()
                                                            .removeFriend(state
                                                                    .friendModelList[
                                                                        index]
                                                                    ?.userToken ??
                                                                '');

                                                    if (isRemoveFriend) {
                                                      context.pop();
                                                      context
                                                          .read<FriendCubit>()
                                                          .changeButton(index);
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: (state.isPaginationLoader) &&
                                          (index ==
                                              (state.friendModelList.length -
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
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
