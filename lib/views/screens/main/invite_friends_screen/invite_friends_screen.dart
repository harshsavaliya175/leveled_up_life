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
import 'package:leveled_up_life/models/response_model/friend_model/friend_model.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/bloc/challenges_cubit.dart';
import 'package:leveled_up_life/views/screens/main/invite_friends_screen/bloc/invite_friends_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_check_box.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class InviteFriendsForChallengesScreen extends StatelessWidget {
  InviteFriendsForChallengesScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<InviteFriendsCubit>().loadMoreFriendData();
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
          displayLeading: true,
          title: LocaleKeys.invite_friends.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: Container(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: BlocBuilder<InviteFriendsCubit, InviteFriendsState>(
                    builder: (BuildContext context, InviteFriendsState state) {
                      return ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        itemCount: state.friendModelList.length,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            12.gapSpace(),
                        itemBuilder: (BuildContext context, int index) {
                          FriendModel? friend = state.friendModelList[index];
                          return Material(
                            borderRadius: BorderRadius.circular(8),
                            color: coolFiftyColor,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                context
                                    .read<InviteFriendsCubit>()
                                    .createUsersTokenList(index);
                              },
                              child: Container(
                                height: 72,
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: (friend?.userProfilePhoto
                                                  ?.isNotEmpty ??
                                              false)
                                          ? AppNetworkImage(
                                              imagePath: profileImagePath +
                                                  (friend?.userProfilePhoto ??
                                                      ''),
                                              errorWidget: Assets
                                                  .images.imgPlaceUser
                                                  .image(
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
                                    Text(
                                      friend?.userName ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.avenirNextMedium,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    AppCheckBox(
                                      checkBoxValue: friend?.isSelect ?? false,
                                      onChanged: (bool? value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      bottomNavigationBar: BlocListener<InviteFriendsCubit, InviteFriendsState>(
        listener: (BuildContext context, InviteFriendsState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.responseItem != null && state.responseItem!.status) {
            context.read<ChallengesCubit>().getChallengeList();
            context.goNamed(AppRoutes.challenges);
          }
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: AppButton(
            fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
            onTap: () {
              context.read<InviteFriendsCubit>().createChallenge();
            },
            child: Text(
              LocaleKeys.create_challenge.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.avenirNextBold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
