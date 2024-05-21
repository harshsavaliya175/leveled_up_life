import 'package:flutter/material.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:leveled_up_life/views/screens/splash_screen.dart';

enum Routes {
  splash,
  signUp,
  signIn,
  forgotPassword,
  resetPassword,
  home;
}

class Routing {
  static Map<String, Widget Function(BuildContext)> route = {
    Routes.splash.name: (context) => const SplashScreen(),
    Routes.signIn.name: (context) => const SignInScreen(),
  };
}
