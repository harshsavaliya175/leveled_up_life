import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/bloc/challenges_cubit.dart';
import 'package:leveled_up_life/views/screens/main/dashboard_screen/bloc/dashboard_cubit.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/bloc/find_friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/bloc/my_habit_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    DashboardCubit dashboardCubit = BlocProvider.of<DashboardCubit>(context);
    Size size = context.getScreenSize;
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (BuildContext context, DashboardState state) {
        return Scaffold(
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: navigationShell,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 15,
            backgroundColor: Colors.white,
            currentIndex: state.selectedIndex,
            selectedItemColor: buttonColor,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontFamily: FontFamily.avenirNextMedium,
            ),
            unselectedItemColor: primaryColor,
            unselectedLabelStyle: const TextStyle(
              color: primaryColor,
              fontSize: 10,
              fontFamily: FontFamily.avenirNextMedium,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (int value) {
              goBranch(value);
              if (value == 0) {
                context.read<HomeCubit>().getBadge();
                context.read<HomeCubit>().getChallengeDay();
              } else if (value == 1) {
                context.read<FindFriendCubit>().initData();
                context.read<FindFriendCubit>().getFriendRequestCount();
                context.read<FindFriendCubit>().getSearchFriendList();
              } else if (value == 2) {
                context.read<ChallengesCubit>().initData();
                context.read<ChallengesCubit>().getChallengeList();
                context.read<ChallengesCubit>().getChallengeRequestCount();
              } else if (value == 3) {
                context.read<MyHabitCubit>().initData();
                context.read<MyHabitCubit>().getHabitsList();
              }
              dashboardCubit.bottomNavigationOnTap(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Assets.icons.icHome.svg(
                  height: 28,
                  width: 28,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    state.selectedIndex == 0 ? buttonColor : primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.icFindFriend.svg(
                  height: 28,
                  width: 28,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    state.selectedIndex == 1 ? buttonColor : primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: LocaleKeys.find_friend.tr(),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.icChallenges.svg(
                  height: 28,
                  width: 28,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    state.selectedIndex == 2 ? buttonColor : primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: LocaleKeys.challenges.tr(),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.icMyHabits.svg(
                  height: 28,
                  width: 28,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    state.selectedIndex == 3 ? buttonColor : primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: LocaleKeys.my_habits.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
