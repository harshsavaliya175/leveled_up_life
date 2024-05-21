import 'package:codonnier_network/network.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/env/build_env.dart';
import 'config/routes/route_manager.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/app_bloc_providers.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  BuildEnv.init(
      buildEnvironment: BuildEnvironment.development, baseUrl: devUrl);
  restClient = RestClient(baseUrl: env?.baseUrl ?? "", token: token);
  await preferences.init();
  await preferences.putAppDeviceInfo();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: DevicePreview(
        enabled: true,
        builder: (context) {
          return const MyApp();
        }
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RestClientBuilder(
      baseUrl: devUrl,
      builder: (context, _) {
        return MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: Routes.splash.name,
            routes: Routing.route,
            theme: AppTheme.lightTheme,
          ),
        );
      },
    );
  }
}
