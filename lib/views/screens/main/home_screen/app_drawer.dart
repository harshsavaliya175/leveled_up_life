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
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/change_password_screen/bloc/change_password_cubit.dart';
import 'package:leveled_up_life/views/screens/main/edit_profile_screen/bloc/edit_profile_cubit.dart';
import 'package:leveled_up_life/views/screens/main/friends_screen/bloc/friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/app_drawer_item.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/screens/main/set_notifications_screen/bloc/set_notifications_cubit.dart';
import 'package:leveled_up_life/views/screens/main/subscription_screen/bloc/subscription_cubit.dart';
import 'package:leveled_up_life/views/widgets/alert_dialog_widget.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    Size size = context.getScreenSize;
    String? name = preferences.getString(SharedPreference.userName);
    String? profileImage = profileImagePath +
        (preferences.getString(SharedPreference.userProfileImage) ?? '');
    return Drawer(
      shape: const OutlineInputBorder(borderRadius: BorderRadius.zero),
      width: size.width * 0.85,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 330,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    Color(0XFF001838),
                  ],
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor,
                      Color(0XFF001838),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(68),
                        child: Container(
                          height: 136,
                          width: 136,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: AppNetworkImage(
                            imagePath: profileImage,
                            errorWidget: Assets.images.imgPlaceUser.image(
                              fit: BoxFit.cover,
                            ),
                            loadingBuilderWidth: 136,
                            loadingBuilderHeight: 136,
                            loadingColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    20.gapSpace(),
                    Text(
                      name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: FontFamily.avenirNextDemi,
                      ),
                    ),
                    8.gapSpace(),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (BuildContext context, HomeState state) {
                        return Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              context
                                  .read<FriendCubit>()
                                  .getFriendList(isLoading: true);
                              context.pushNamed(AppRoutes.friends).then(
                                (value) {
                                  context.read<HomeCubit>().getFriendsCount();
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: RichText(
                                text: TextSpan(
                                  text: '${state.friends}',
                                  style: const TextStyle(
                                    color: coolThreeColor,
                                    fontSize: 16,
                                    fontFamily: FontFamily.avenirNextDemi,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' ${LocaleKeys.friends.tr()}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: coolThreeColor,
                                        fontFamily:
                                            FontFamily.avenirNextRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppDrawerItem(
            title: LocaleKeys.subscription.tr(),
            leading: Assets.icons.icSubscription.svg(
              height: 28,
              width: 28,
            ),
            onTap: () {
              context.pop();
              context.pushNamed(AppRoutes.subscription);
              context.read<SubscriptionCubit>().initData();
              context
                  .read<SubscriptionCubit>()
                  .initializeInAppPurchase(isCallInitStore: true);
            },
          ),
          AppDrawerItem(
            title: LocaleKeys.set_notifications.tr(),
            leading: Assets.icons.icNotification.svg(
              height: 28,
              width: 28,
            ),
            onTap: () {
              context.pop();
              context.read<SetNotificationsCubit>().initData();
              context.read<SetNotificationsCubit>().getNotificationsData();
              context.pushNamed(AppRoutes.setNotifications);
            },
          ),
          AppDrawerItem(
            title: LocaleKeys.edit_profile.tr(),
            leading: Assets.icons.icEdit.svg(
              height: 28,
              width: 28,
            ),
            onTap: () {
              context.pop();
              context.read<EditProfileCubit>().initData();
              context.read<EditProfileCubit>().fillEditProfileData();
              context.pushNamed(AppRoutes.editProfile);
            },
          ),
          AppDrawerItem(
            title: LocaleKeys.change_password.tr(),
            leading: Assets.icons.icNavLock.svg(
              height: 28,
              width: 28,
            ),
            onTap: () {
              context.pop();
              context.read<ChangePasswordCubit>().initData();
              context.pushNamed(AppRoutes.changePassword);
            },
          ),
          AppDrawerItem(
            title: LocaleKeys.delete_account.tr(),
            leading: Assets.icons.icDeleteAccount.svg(
              height: 28,
              width: 28,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
            ),
            itemColor: Colors.red,
            onTap: () {
              context.showAppDialog(
                contentWidget: AlertDialogWidget(
                  title:
                      LocaleKeys.are_you_sure_you_want_to_delete_account.tr(),
                  onTap: () async {
                    bool isDeleteAccount =
                        await context.read<HomeCubit>().deleteAccount();
                    if (isDeleteAccount) {
                      context.forceLogout();
                    }
                  },
                ),
              );
            },
          ),
          AppDrawerItem(
            title: LocaleKeys.log_out.tr(),
            leading: Assets.icons.icLogout.svg(
              height: 28,
              width: 28,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
            ),
            itemColor: Colors.red,
            onTap: () {
              context.showAppDialog(
                contentWidget: AlertDialogWidget(
                  title: LocaleKeys.are_you_sure_you_want_to_logout.tr(),
                  onTap: () async {
                    bool isLogOut =
                        await context.read<HomeCubit>().logoutUser();
                    if (isLogOut) {
                      context.forceLogout();
                      // preferences.clearUserInfo();
                      // context.read<SignInCubit>().initData();
                      // context.goNamed(AppRoutes.signIn);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
