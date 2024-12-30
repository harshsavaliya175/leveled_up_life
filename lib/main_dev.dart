import 'dart:async';
import 'dart:developer';

import 'package:advanced_in_app_review/advanced_in_app_review.dart';
import 'package:codonnier_network/network.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leveled_up_life/core/constants/app_bloc_providers.dart';
import 'package:leveled_up_life/core/constants/app_easy_loading.dart';
import 'package:leveled_up_life/service_injector.dart';

import 'config/routes/route_manager.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/deeplink_util.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/preference.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackGroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    log('some notification received');
    await Firebase.initializeApp();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackGroundHandler);
  AdvancedInAppReview()
      // .setMinDaysBeforeRemind(7)
      // .setMinDaysAfterInstall(2)
      .setMinLaunchTimes(2)
      .setMinSecondsBeforeShowDialog(4)
      .monitor();
  await serviceInjection();
  await si.allReady();
  si.get<SharedPreference>().putAppDeviceInfo();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black26,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<Map> streamSubscriptionDeepLink;

  Future<void> initBranchSdk() async {
    await FlutterBranchSdk.init(disableTracking: false);
    streamSubscriptionDeepLink = DeepLinkUtil.init();
  }

  @override
  void initState() {
    initBranchSdk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RestClientBuilder(
      baseUrl: devUrl,
      builder: (BuildContext context, RestClient _) {
        return MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: MaterialApp.router(
            title: 'Morning Discipline Journal',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: AppRoutes.router,
            theme: AppTheme.lightTheme,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscriptionDeepLink.cancel();
  }
}
