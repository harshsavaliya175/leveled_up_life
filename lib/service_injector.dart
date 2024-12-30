import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:leveled_up_life/api/repo/auth_repo.dart';
import 'package:leveled_up_life/api/repo/bible_book_repo.dart';
import 'package:leveled_up_life/api/repo/challenge_repo.dart';
import 'package:leveled_up_life/api/repo/friend_repo.dart';
import 'package:leveled_up_life/api/repo/grateful_and_affirmation_repo.dart';
import 'package:leveled_up_life/api/repo/my_habit_repo.dart';
import 'package:leveled_up_life/api/repo/other_repo.dart';
import 'package:leveled_up_life/api/repo/subscription_repo.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/core/utils/push_notification_utils.dart';
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
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_utils.dart';
import 'core/utils/deeplink_util.dart';
import 'views/screens/main/chapter_read_screen/bloc/chapter_read_cubit.dart';
import 'views/screens/main/subscription_screen/bloc/subscription_cubit.dart';

final GetIt si = GetIt.instance;

Future<void> serviceInjection() async {
  /// Shared Preferences
  si.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  si.registerSingleton<SharedPreference>(SharedPreference());

  /// Repositories
  si.registerSingleton<AuthRepo>(AuthRepo());
  si.registerSingleton<GratefulAndAffirmationRepo>(
      GratefulAndAffirmationRepo());
  si.registerSingleton<MyHabitRepo>(MyHabitRepo());
  si.registerSingleton<FriendRepo>(FriendRepo());
  si.registerSingleton<ChallengeRepo>(ChallengeRepo());
  si.registerSingleton<BibleBookRepo>(BibleBookRepo());
  si.registerSingleton<OtherRepo>(OtherRepo());
  si.registerSingleton<SubscriptionRepo>(SubscriptionRepo());

  /// Notification Service
  si.registerSingleton<NotificationUtils>(NotificationUtils(si(), si()));

  /// Deeplink Service
  si.registerSingleton<DeepLinkUtil>(DeepLinkUtil());

  /// App Utils
  si.registerSingleton<AppUtils>(AppUtils());

  /// Blocs
  si.registerFactory<SignInCubit>(() => SignInCubit(si()));
  si.registerFactory<SignUpCubit>(() => SignUpCubit(si()));
  si.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(si()));
  si.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(si()));
  si.registerFactory<DashboardCubit>(() => DashboardCubit());
  si.registerFactory<HomeCubit>(() => HomeCubit(si(), si(), si()));
  si.registerFactory<CreateNewChallengeCubit>(() => CreateNewChallengeCubit());
  si.registerFactory<SetNotificationsCubit>(() => SetNotificationsCubit(si()));
  si.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(si()));
  si.registerFactory<MyHabitCubit>(() => MyHabitCubit(si()));
  si.registerFactory<ThirtyDaysChallengesCubit>(
      () => ThirtyDaysChallengesCubit(si()));
  si.registerFactory<GratefulCubit>(() => GratefulCubit(si()));
  si.registerFactory<AffirmationCubit>(() => AffirmationCubit(si()));
  si.registerFactory<EditProfileCubit>(() => EditProfileCubit(si()));
  si.registerFactory<FindFriendCubit>(() => FindFriendCubit(si()));
  si.registerFactory<ChallengesCubit>(() => ChallengesCubit(si()));
  si.registerFactory<FriendCubit>(() => FriendCubit(si()));
  si.registerFactory<FriendRequestCubit>(() => FriendRequestCubit(si()));
  si.registerFactory<ProfileDetailsCubit>(
      () => ProfileDetailsCubit(si(), si()));
  si.registerFactory<ChallengeRequestCubit>(() => ChallengeRequestCubit(si()));
  si.registerFactory<BibleScreenCubit>(() => BibleScreenCubit(si()));
  si.registerFactory<ChaptersCubit>(() => ChaptersCubit(si()));
  si.registerFactory<InviteFriendsCubit>(() => InviteFriendsCubit(si(), si()));
  si.registerFactory<ChapterReadCubit>(() => ChapterReadCubit(si()));
  si.registerFactory<ChallengeDetailsCubit>(() => ChallengeDetailsCubit(si()));
  si.registerFactory<SubscriptionCubit>(() => SubscriptionCubit(si()));
  si.registerFactory<NotificationCubit>(
      () => NotificationCubit(si(), si(), si()));
}
