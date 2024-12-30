import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/auth/forgot_password_screen/bloc/forgot_password_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/reset_password_screen/bloc/reset_password_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_up_screen/bloc/sign_up_cubit.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/bloc/affirmation_cubit.dart';
import 'package:leveled_up_life/views/screens/main/bible_screen/bloc/bible_screen_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/bloc/challenge_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/bloc/challenge_request_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenges_screen/bloc/challenges_cubit.dart';
import 'package:leveled_up_life/views/screens/main/change_password_screen/bloc/change_password_cubit.dart';
import 'package:leveled_up_life/views/screens/main/chapter_read_screen/bloc/chapter_read_cubit.dart';
import 'package:leveled_up_life/views/screens/main/chapter_screen/bloc/chapters_cubit.dart';
import 'package:leveled_up_life/views/screens/main/create_new_challenge_screen/bloc/create_new_challenge_cubit.dart';
import 'package:leveled_up_life/views/screens/main/dashboard_screen/bloc/dashboard_cubit.dart';
import 'package:leveled_up_life/views/screens/main/edit_profile_screen/bloc/edit_profile_cubit.dart';
import 'package:leveled_up_life/views/screens/main/find_friend_screen/bloc/find_friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/friend_request_screen/bloc/friend_request_cubit.dart';
import 'package:leveled_up_life/views/screens/main/friends_screen/bloc/friend_cubit.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/bloc/grateful_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/screens/main/invite_friends_screen/bloc/invite_friends_cubit.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/bloc/my_habit_cubit.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/bloc/notification_cubit.dart';
import 'package:leveled_up_life/views/screens/main/profile_details_screen/bloc/profile_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/set_notifications_screen/bloc/set_notifications_cubit.dart';
import 'package:leveled_up_life/views/screens/main/subscription_screen/bloc/subscription_cubit.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';

class AppBlocProviders {
  AppBlocProviders._();

  static List<BlocProvider> providers = [
    BlocProvider<SignInCubit>(create: (BuildContext _) => si()),
    BlocProvider<SignUpCubit>(create: (BuildContext _) => si()),
    BlocProvider<ForgotPasswordCubit>(create: (BuildContext _) => si()),
    BlocProvider<ResetPasswordCubit>(create: (BuildContext _) => si()),
    BlocProvider<DashboardCubit>(create: (BuildContext _) => si()),
    BlocProvider<HomeCubit>(create: (BuildContext _) => si()),
    BlocProvider<CreateNewChallengeCubit>(create: (BuildContext _) => si()),
    BlocProvider<SetNotificationsCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChangePasswordCubit>(create: (BuildContext _) => si()),
    BlocProvider<MyHabitCubit>(create: (BuildContext _) => si()),
    BlocProvider<ThirtyDaysChallengesCubit>(create: (BuildContext _) => si()),
    BlocProvider<GratefulCubit>(create: (BuildContext _) => si()),
    BlocProvider<AffirmationCubit>(create: (BuildContext _) => si()),
    BlocProvider<EditProfileCubit>(create: (BuildContext _) => si()),
    BlocProvider<FindFriendCubit>(create: (BuildContext _) => si()),
    BlocProvider<FriendCubit>(create: (BuildContext _) => si()),
    BlocProvider<FriendRequestCubit>(create: (BuildContext _) => si()),
    BlocProvider<ProfileDetailsCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChallengesCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChallengeRequestCubit>(create: (BuildContext _) => si()),
    BlocProvider<BibleScreenCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChaptersCubit>(create: (BuildContext _) => si()),
    BlocProvider<InviteFriendsCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChapterReadCubit>(create: (BuildContext _) => si()),
    BlocProvider<ChallengeDetailsCubit>(create: (BuildContext _) => si()),
    BlocProvider<NotificationCubit>(create: (BuildContext _) => si()),
    BlocProvider<SubscriptionCubit>(create: (BuildContext _) => si()),
  ];
}
