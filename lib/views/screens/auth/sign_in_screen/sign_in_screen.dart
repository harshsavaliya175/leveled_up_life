import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/auth/forgot_password_screen/bloc/forgot_password_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_up_screen/bloc/sign_up_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_password_suffix_icon.dart';

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
            height: size.height / 3.2,
            width: size.width,
            alignment: Alignment.topCenter,
          ),
          ListView(
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
                  fontSize: 28,
                  color: Colors.white,
                  fontFamily: FontFamily.avenirNextBold,
                ),
              ).paddingSymmetric(horizontal: 20),
              12.gapSpace(),
              Text(
                LocaleKeys.lets_sign_in_for_explore_continues.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  color: greyColor,
                ),
              ).paddingSymmetric(horizontal: 20),
              40.gapSpace(),
              Text(
                LocaleKeys.email_address.tr(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: FontFamily.avenirNextMedium,
                ),
              ).paddingSymmetric(horizontal: 20),
              8.gapSpace(),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (SignInState previous, SignInState current) {
                  return previous.email != current.email;
                },
                builder: (BuildContext context, SignInState state) {
                  return AppTextField(
                    onChange: (String val) {
                      context.read<SignInCubit>().changeData(email: val);
                    },
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    hintText: LocaleKeys.email_address.tr(),
                    prefixIcon: Assets.icons.icMail.svg(fit: BoxFit.scaleDown),
                  );
                },
              ).paddingSymmetric(horizontal: 20),
              20.gapSpace(),
              Text(
                LocaleKeys.password.tr(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: FontFamily.avenirNextMedium,
                ),
              ).paddingSymmetric(horizontal: 20),
              8.gapSpace(),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (SignInState previous, SignInState current) {
                  return previous.passwordVisibility !=
                          current.passwordVisibility ||
                      previous.password != current.password;
                },
                builder: (BuildContext context, SignInState state) {
                  return AppTextField(
                    onChange: (String val) {
                      context.read<SignInCubit>().changeData(password: val);
                    },
                    action: TextInputAction.done,
                    type: TextInputType.text,
                    hintText: LocaleKeys.enter_password.tr(),
                    prefixIcon: Assets.icons.icLock.svg(
                      fit: BoxFit.scaleDown,
                    ),
                    obscureText: !state.passwordVisibility,
                    suffixIcon: CommonSuffixIcon(
                      onTap: () {
                        context.read<SignInCubit>().changeData(
                            passwordVisibility: !state.passwordVisibility);
                      },
                      isVisible: state.passwordVisibility,
                    ),
                  );
                },
              ).paddingSymmetric(horizontal: 20),
              14.gapSpace(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.read<ForgotPasswordCubit>().initData();
                    context.pushNamed(AppRoutes.forgotPassword);
                  },
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.avenirNextMedium,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).paddingOnly(right: 10),
              38.gapSpace(),
              BlocListener<SignInCubit, SignInState>(
                listener: (BuildContext context, SignInState state) async {
                  if (state.message.isNotEmpty) {
                    context.showAppSnackBar(
                      message: state.message,
                      backgroundColor: Colors.white,
                      textColor: primaryColor,
                    );
                  }
                  if (state.responseItem != null &&
                      state.responseItem!.status) {
                    context.read<HomeCubit>().initData();
                    context.read<HomeCubit>().getBadge();
                    context.read<HomeCubit>().getChallengeDay();
                    context.read<HomeCubit>().sendRequestBranchIO();
                    context.read<HomeCubit>().getBibleVerse(false);
                    context.goNamed(AppRoutes.home);
                  }
                },
                child: AppButton(
                  fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
                  onTap: () {
                    context.hideKeyboard();
                    context.read<SignInCubit>().signInButton();
                  },
                  child: Text(
                    LocaleKeys.sign_in.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.avenirNextBold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20),
              24.gapSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.do_not_have_an_account.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: lightGreyColor,
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                    ),
                    onPressed: () {
                      context.hideKeyboard();
                      context.read<SignUpCubit>().initData();
                      context.pushNamed(AppRoutes.signUp);
                    },
                    child: Text(
                      LocaleKeys.sign_up.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.avenirNextDemi,
                        color: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
