import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';

String devUrl = 'http://64.23.245.118/leveled_up_life/dev/Service.php';
String liveUrl = 'http://64.23.245.118/leveled_up_life/live/Service.php';
const String imagePath = 'http://64.23.245.118/leveled_up_life/app_images/';
const String profileImagePath = '${imagePath}profile_images/';
const String gratefulImagePath = '${imagePath}grateful_images/';
String token = '';
String title = 'title';
String subTitle = 'subTitle';
String buttonText = 'buttonText';
String bgImagePath = 'bgImagePath';
String friend = 'FRIEND';
String friendRequest = 'FRIEND_REQUEST';
String accept = 'ACCEPT';
String reject = 'REJECT';
String add = 'ADD';
String edit = 'EDIT';
String requestCount = 'request_count';
const String channelId = "leveled_up_life_app_channel";
const String channelName = "leveled_up_life_app";
const String channelDes = "leveled_up_life_app_channel_des";
const String sendFriendRequest = "SEND_FRIEND_REQUEST";
const String sendChallengeRequest = "SEND_CHALLENGE_REQUEST";
const String acceptChallengeRequest = "ACCEPT_CHALLENGE_REQUEST";
const String acceptFriendRequest = "ACCEPT_FRIEND_REQUEST";
const String affirmation = "AFFIRMATION";
const String motivationsQuotes = "MOTIVATIONS_QUOTES";
const String habits = "HABITS";
const String completeChallenge = "COMPLETE_CHALLENGE";
const String thirtyDaysChallenge = "30_DAYS_CHALLANGE";
const String checkThirtyDaysChallenge = "CHECK_30_DAYS_CHALLANGE";
const String thirtyZDaysBibleVerseChallenge = "30_DAYS_BIBLE_VERSE_CHALLANGE";
const String daily = "DAILY";
const String weekly = "WEEKLY";
const String monthly = "MONTHLY";
const String bookName = "bookName";
const String chapters = "chapters";
const int limit = 50;
const String subsTermsTextAndroid =
    "Payment will be charged to your Google account at the confirmation of purchase. Subscription automatically renews unless it is cancelled at least 24 hours before the end of the current period. Your account will be charged for renewal within 24 hours before the end of the current period. You can manage and cancel your subscriptions by going to your Payment and Subscriptions page on the Play Store after purchase.\n";
const String subsTermsTextIOS =
    "Payment will be charged to your Apple ID account at the confirmation of purchase. Subscription automatically renews unless it is cancelled at least 24 hours before the end of the current period. Your account will be charged for renewal within 24 hours before the end of the current period. You can manage and cancel your subscriptions by going to your account settings on the App Store after purchase.\n";
const String privacyPolicyLabel = 'Privacy Policy';
const String termsOfUse = 'Terms of Use';
const String and = ' and ';
const String forMoreInfo = "For more information, please visit our ";
bool isPurchase = false;
String privacyPolicyLink = "https://bonus.aleveleduplife.io/support-page";
String termsAndConditionLink = "https://example.com/terms";
String appStoreLink =
    "https://apps.apple.com/us/app/leveled-up-life/id6738300882";
String playStoreLink = "https://play.google.com";
String storeLink = Platform.isIOS
    ? "Install Morning Discipline Journal from App Store: $appStoreLink"
    : "Install Morning Discipline Journal from Play Store : $playStoreLink";

List<Map> homeComponent = [
  {
    title: LocaleKeys.thirty_days_leveled_up_challenges.tr(),
    subTitle: LocaleKeys.challenge_yourself_and_have_a_blast.tr(),
    buttonText: LocaleKeys.lets_go.tr(),
    // bgImagePath: Assets.icons.icWhiteLogo.path,
    bgImagePath: Assets.images.imgHomeComponentBackground1.path,
  },
  {
    title: LocaleKeys.bible_verse_challenge_for_thirty_days.tr(),
    subTitle: LocaleKeys.reading_verse_thirty_day.tr(),
    buttonText: LocaleKeys.view.tr(),
    bgImagePath: Assets.images.imgBiblelBook.path,
    // bgImagePath: Assets.images.imgHomeComponentBackground2.path,
  },
];

// const Map<String, String> bibleApiHeader = {
//   "accept": "application/json",
//   "api-key": "b49d9884cb92604028b26bd128f8e068"
// };
// const String bibleApiBaseUrl = "https://api.scripture.api.bible";
const String bibleGetBookUrl = "https://bolls.life/get-books/NIV/";
const String bibleChaptersDetailBaseUrl = "https://bolls.life/get-text/NIV/";
