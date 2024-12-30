import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/app_utils.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/bloc/find_friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/find_friend_list_data.dart';
import 'package:leveled_up_life/views/screens/main/friend_request_screen/bloc/friend_request_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_blur_icon_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class FindFriendScreen extends StatelessWidget {
  FindFriendScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<FindFriendCubit>().loadMoreSearchFriendData();
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
          title: LocaleKeys.find_friend.tr(),
          displayLeading: false,
          actionWidget: [
            AppBlurIconButton(
              onTap: () async {
                String? generateShortUrl =
                    await si.get<AppUtils>().generateShortUrlForInviteFriend();

                log("generateShortUrl ------------------> $generateShortUrl");

                await SharePlusUtil().shareTextOrImage(
                  shareText:
                      "You have been invited to become a friend of ${si.get<SharedPreference>().getString(SharedPreference.userName)}\n\nPlease use this link to become a friend: ${generateShortUrl ?? ""}",
                  shareImageUrl: '',
                );
              },
              child: Assets.icons.icShare.svg(
                height: 18,
                width: 21,
                fit: BoxFit.cover,
              ),
            ),
            5.gapSpace(),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Stack(
                alignment: const Alignment(1.1, -1.2),
                children: [
                  AppBlurIconButton(
                    onTap: () {
                      context.read<FriendRequestCubit>().getFriendRequestList();
                      context.pushNamed(AppRoutes.friendRequest).then(
                        (value) {
                          context.read<FindFriendCubit>().getSearchFriendList();
                          context
                              .read<FindFriendCubit>()
                              .getFriendRequestCount();
                        },
                      );
                    },
                    child: Assets.icons.icPersons.svg(
                      height: 18,
                      width: 21,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: BlocBuilder<FindFriendCubit, FindFriendState>(
                      builder: (BuildContext context, FindFriendState state) {
                        return Text(
                          '${state.getFriendRequestCount}',
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
              ).paddingOnly(right: 20),
            ),
          ],
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
              24.gapSpace(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextField(
                  // controller: searchController,
                  onChange: (String val) {
                    context.read<FindFriendCubit>().changeData(searchText: val);
                    context
                        .read<FindFriendCubit>()
                        .getSearchFriendList(callFromSearch: true);
                  },
                  fillColor: coolFiftyColor,
                  hintText: LocaleKeys.search_friends.tr(),
                  action: TextInputAction.done,
                  type: TextInputType.text,
                  prefixIcon: Assets.icons.icSearch.svg(
                    height: 20,
                    width: 20,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              24.gapSpace(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  LocaleKeys.recently_search.tr(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontFamily: FontFamily.avenirNextDemi,
                  ),
                ),
              ),
              BlocBuilder<FindFriendCubit, FindFriendState>(
                builder: (BuildContext context, FindFriendState state) {
                  return Expanded(
                    child: state.searchFriendModelList.isEmpty
                        ? Center(
                            child: Text(
                              LocaleKeys.friends_not_found.tr(),
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          )
                        : FriendListData(controller: scrollController),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
