import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/models/response_model/search_friend_model/search_friend_model.dart';
import 'package:leveled_up_life/views/screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:leveled_up_life/views/screens/auth/reset_password_screen/reset_password_screen.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:leveled_up_life/views/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/affirmation_screen.dart';
import 'package:leveled_up_life/views/screens/main/bible_screen/bible_screen.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/challenge_detail_screen.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/challenge_request_screen.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/challenges_screen.dart';
import 'package:leveled_up_life/views/screens/main/change_password_screen/change_password_screen.dart';
import 'package:leveled_up_life/views/screens/main/chapter_read_screen/chapter_read_screen.dart';
import 'package:leveled_up_life/views/screens/main/chapter_screen/chapter_screen.dart';
import 'package:leveled_up_life/views/screens/main/create_new_challenge_screen/create_new_challenge_screen.dart';
import 'package:leveled_up_life/views/screens/main/dashboard_screen/dashboard_screen.dart';
import 'package:leveled_up_life/views/screens/main/edit_profile_screen/edit_profile_screen.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/find_friend_screen.dart';
import 'package:leveled_up_life/views/screens/main/friend_request_screen/friend_request_screen.dart';
import 'package:leveled_up_life/views/screens/main/friends_screen/friends_screen.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/grateful_screen.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/home_screen.dart';
import 'package:leveled_up_life/views/screens/main/invite_friends_screen/invite_friends_screen.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/my_habits_screen.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/notification_screen.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/profile_details_screen.dart';
import 'package:leveled_up_life/views/screens/main/set_notifications_screen/set_notifications_screen.dart';
import 'package:leveled_up_life/views/screens/main/subscription_screen/subscription_screen.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/thirty_days_challenges_screen.dart';
import 'package:leveled_up_life/views/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = 'splash';
  static const String signUp = 'signUp';
  static const String signIn = 'signIn';
  static const String forgotPassword = 'forgotPassword';
  static const String resetPassword = 'resetPassword';
  static const String home = 'home';
  static const String findFriend = 'findFriend';
  static const String challenges = 'challenges';
  static const String createChallenge = 'createChallenge';
  static const String myHabits = 'myHabits';
  static const String notification = 'notification';
  static const String bible = 'bible';
  static const String chapters = 'chapter';
  static const String chapterRead = 'chapterRead';
  static const String profileDetails = 'profileDetails';
  static const String inviteFriendForChallenges = 'inviteFriendForChallenges';
  static const String challengeRequest = 'challengeRequest';
  static const String challengeDetail = 'challengeDetail';
  static const String friendRequest = 'friendRequest';
  static const String friends = 'friends';
  static const String grateful = 'grateful';
  static const String editProfile = 'editProfile';
  static const String changePassword = 'changePassword';
  static const String setNotifications = 'setNotifications';
  static const String subscription = 'subscription';
  static const String thirtyDaysChallenges = 'thirtyDaysChallenges';
  static const String affirmation = 'affirmation';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> rootNavigatorHomeScreen =
      GlobalKey<NavigatorState>(debugLabel: 'Home Screen');
  static final GlobalKey<NavigatorState> rootNavigatorFindFriendScreen =
      GlobalKey<NavigatorState>(debugLabel: 'Find Friend Screen');
  static final GlobalKey<NavigatorState> rootNavigatorChallengesScreen =
      GlobalKey<NavigatorState>(debugLabel: 'Challenges Screen');
  static final GlobalKey<NavigatorState> rootNavigatorMyHabitsScreen =
      GlobalKey<NavigatorState>(debugLabel: 'My Habits Screen');

  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: splash,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: signIn,
        path: '/$signIn',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        name: signUp,
        path: '/$signUp',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        name: forgotPassword,
        path: '/$forgotPassword',
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPasswordScreen();
        },
      ),
      GoRoute(
        name: resetPassword,
        path: '/$resetPassword',
        builder: (BuildContext context, GoRouterState state) {
          return ResetPasswordScreen(email: state.extra as String);
        },
      ),
      GoRoute(
        name: notification,
        path: '/$notification',
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationScreen();
        },
      ),
      GoRoute(
        name: bible,
        path: '/$bible',
        builder: (BuildContext context, GoRouterState state) {
          return const BibleScreen();
        },
      ),
      GoRoute(
        name: chapters,
        path: '/$chapters',
        builder: (BuildContext context, GoRouterState state) {
          return const ChapterScreen(
              // title: "${state.extra}",
              );
        },
      ),
      GoRoute(
        name: chapterRead,
        path: '/$chapterRead',
        builder: (BuildContext context, GoRouterState state) {
          return ChapterReadScreen(
              // title: "${state.extra}",
              );
        },
      ),
      GoRoute(
        name: createChallenge,
        path: '/$createChallenge',
        builder: (BuildContext context, GoRouterState state) {
          return const CreateNewChallengeScreen();
        },
      ),
      GoRoute(
        name: inviteFriendForChallenges,
        path: '/$inviteFriendForChallenges',
        builder: (BuildContext context, GoRouterState state) {
          return InviteFriendsForChallengesScreen();
        },
      ),
      GoRoute(
        name: challengeRequest,
        path: '/$challengeRequest',
        builder: (BuildContext context, GoRouterState state) {
          return ChallengeRequestScreen();
        },
      ),
      GoRoute(
        name: challengeDetail,
        path: '/$challengeDetail',
        builder: (BuildContext context, GoRouterState state) {
          return ChallengeDetailScreen(
            selectedUserToken:
                (state.extra is String) ? (state.extra as String) : '',
          );
        },
      ),
      GoRoute(
        name: grateful,
        path: '/$grateful',
        builder: (BuildContext context, GoRouterState state) {
          return GratefulScreen();
        },
      ),
      GoRoute(
        name: affirmation,
        path: '/$affirmation',
        builder: (BuildContext context, GoRouterState state) {
          return AffirmationScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return DashboardScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: rootNavigatorHomeScreen,
            routes: [
              GoRoute(
                name: home,
                path: '/$home',
                builder: (BuildContext context, GoRouterState state) {
                  return HomeScreen(key: state.pageKey);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: rootNavigatorFindFriendScreen,
            routes: [
              GoRoute(
                name: findFriend,
                path: '/$findFriend',
                builder: (BuildContext context, GoRouterState state) {
                  return FindFriendScreen(key: state.pageKey);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: rootNavigatorChallengesScreen,
            routes: [
              GoRoute(
                name: challenges,
                path: '/$challenges',
                builder: (BuildContext context, GoRouterState state) {
                  return ChallengesScreen(key: state.pageKey);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: rootNavigatorMyHabitsScreen,
            routes: [
              GoRoute(
                name: myHabits,
                path: '/$myHabits',
                builder: (BuildContext context, GoRouterState state) {
                  return MyHabitsScreen(key: state.pageKey);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: profileDetails,
        path: '/$profileDetails',
        builder: (BuildContext context, GoRouterState state) {
          return ProfileDetailsScreen(
            searchFriendModel: state.extra as SearchFriendModel,
          );
        },
      ),
      GoRoute(
        name: friendRequest,
        path: '/$friendRequest',
        builder: (BuildContext context, GoRouterState state) {
          return FriendRequestScreen();
        },
      ),
      GoRoute(
        name: friends,
        path: '/$friends',
        builder: (BuildContext context, GoRouterState state) {
          return FriendsScreen();
        },
      ),
      GoRoute(
        name: editProfile,
        path: '/$editProfile',
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        name: changePassword,
        path: '/$changePassword',
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePasswordScreen();
        },
      ),
      GoRoute(
        name: setNotifications,
        path: '/$setNotifications',
        builder: (BuildContext context, GoRouterState state) {
          return const SetNotificationsScreen();
        },
      ),
      GoRoute(
        name: subscription,
        path: '/$subscription',
        builder: (BuildContext context, GoRouterState state) {
          return const SubscriptionScreen();
        },
      ),
      GoRoute(
        name: thirtyDaysChallenges,
        path: '/$thirtyDaysChallenges',
        builder: (BuildContext context, GoRouterState state) {
          return const ThirtyDaysChallengesScreen();
        },
      ),
    ],
  );
}
