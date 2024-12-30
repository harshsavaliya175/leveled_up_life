// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreference preferences = si.get<SharedPreference>();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        if (preferences.getBool(SharedPreference.isLogIn) ?? false) {
          context.read<HomeCubit>().initData();
          context.read<HomeCubit>().getBadge();
          context.read<HomeCubit>().getChallengeDay();
          context.read<HomeCubit>().getBibleVerse(false);
          context.read<HomeCubit>().sendRequestBranchIO();
          context.goNamed(AppRoutes.home);
        } else {
          context.read<SignInCubit>().initData();
          context.goNamed(AppRoutes.signIn);
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
            fit: BoxFit.cover,
          ),
          Assets.images.imgSplashBackground.image(
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Assets.icons.icWholeLogo.svg(),
        ],
      ),
    );
  }
}
