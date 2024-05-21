import 'package:flutter/material.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () async {
        if (preferences.getBool(SharedPreference.isLogIn) ?? false) {
          Navigator.pushReplacementNamed(context, Routes.home.name);
        } else {
          // context.read<SignInCubit>().initData();
          Navigator.pushReplacementNamed(context, Routes.signIn.name);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.imgSplashDesign.image(
            height: size.height,
            width: size.width,
          ),
          Assets.images.imgSplashBackground.image(
            height: size.height,
            width: size.width,
          ),
          Assets.icons.icWholeLogo.svg(),
        ],
      ),
    );
  }
}
