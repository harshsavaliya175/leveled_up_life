import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Assets.images.imgAuthBackground.image(
            height: size.height * 3.2,
            width: size.width,
            alignment: Alignment.topCenter,
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              60.gapSpace(),
              Center(
                child: Assets.icons.icLogo.svg(
                  height: 100,
                  width: 100,
                ),
              ),
              40.gapSpace(),
              Text(
                LocaleKeys.hey_welcome_back.tr(),
                style: const TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              12.gapSpace(),
              Text(
                LocaleKeys.lets_sign_in_for_explore_continues.tr(),
                style: const TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 16,
                  color: greyColor,
                ),
              ),
              40.gapSpace(),
              Text(
                LocaleKeys.email_address.tr(),
                style: const TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
