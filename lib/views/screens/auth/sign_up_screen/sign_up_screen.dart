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
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_up_screen/bloc/sign_up_cubit.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_password_suffix_icon.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (BuildContext context, SignUpState state) async {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(
            message: state.message,
            backgroundColor: Colors.white,
            textColor: primaryColor,
          );
        }
        if (state.responseItem != null && state.responseItem!.status) {
          context.read<HomeCubit>().initData();
          await context.read<HomeCubit>().getChallengeDay();
          await context.read<HomeCubit>().getBadge();
          await context.read<HomeCubit>().getBibleVerse(false);
          await context.read<HomeCubit>().sendRequestBranchIO();
          context.goNamed(AppRoutes.home);
        }
      },
      builder: (BuildContext context, SignUpState state) {
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
                    LocaleKeys.lets_get_started.tr(),
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextBold,
                    ),
                  ),
                  12.gapSpace(),
                  Text(
                    LocaleKeys.create_an_account_to_get_all_features.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: greyColor,
                    ),
                  ),
                  40.gapSpace(),
                  Text(
                    LocaleKeys.full_name.tr(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextMedium,
                    ),
                  ),
                  8.gapSpace(),
                  AppTextField(
                    onChange: (String val) {
                      context.read<SignUpCubit>().changeData(name: val);
                    },
                    action: TextInputAction.next,
                    type: TextInputType.text,
                    hintText: LocaleKeys.enter_full_name.tr(),
                    prefixIcon: Assets.icons.icUser.svg(
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  20.gapSpace(),
                  Text(
                    LocaleKeys.email_address.tr(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextMedium,
                    ),
                  ),
                  8.gapSpace(),
                  AppTextField(
                    onChange: (String val) {
                      context.read<SignUpCubit>().changeData(email: val);
                    },
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    hintText: LocaleKeys.email_address.tr(),
                    prefixIcon: Assets.icons.icMail.svg(
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  20.gapSpace(),
                  Text(
                    LocaleKeys.password.tr(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextMedium,
                    ),
                  ),
                  8.gapSpace(),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (SignUpState previous, SignUpState current) {
                      return previous.passwordVisibility !=
                          current.passwordVisibility;
                    },
                    builder: (BuildContext context, SignUpState state) {
                      return AppTextField(
                        onChange: (String val) {
                          context.read<SignUpCubit>().changeData(password: val);
                        },
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        hintText: LocaleKeys.enter_password.tr(),
                        prefixIcon: Assets.icons.icLock.svg(
                          fit: BoxFit.scaleDown,
                        ),
                        obscureText: !state.passwordVisibility,
                        suffixIcon: CommonSuffixIcon(
                          onTap: () {
                            context.read<SignUpCubit>().changeData(
                                  passwordVisibility: !state.passwordVisibility,
                                );
                          },
                          isVisible: state.passwordVisibility,
                        ),
                      );
                    },
                  ),
                  20.gapSpace(),
                  Text(
                    LocaleKeys.confirm_password.tr(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextMedium,
                    ),
                  ),
                  8.gapSpace(),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (SignUpState previous, SignUpState current) {
                      return previous.confirmPasswordVisibility !=
                          current.confirmPasswordVisibility;
                    },
                    builder: (BuildContext context, SignUpState state) {
                      return AppTextField(
                        onChange: (String val) {
                          context
                              .read<SignUpCubit>()
                              .changeData(confirmPassword: val);
                        },
                        action: TextInputAction.done,
                        type: TextInputType.text,
                        hintText: LocaleKeys.re_enter_password.tr(),
                        prefixIcon: Assets.icons.icLock.svg(
                          fit: BoxFit.scaleDown,
                        ),
                        obscureText: !state.confirmPasswordVisibility,
                        suffixIcon: CommonSuffixIcon(
                          onTap: () {
                            context.read<SignUpCubit>().changeData(
                                  confirmPasswordVisibility:
                                      !state.confirmPasswordVisibility,
                                );
                          },
                          isVisible: state.confirmPasswordVisibility,
                        ),
                      );
                    },
                  ),
                  48.gapSpace(),
                  AppButton(
                    fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
                    child: Text(
                      LocaleKeys.sign_up.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.avenirNextBold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      context.read<SignUpCubit>().signUpButton();
                    },
                  ),
                  24.gapSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.have_an_account.tr(),
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
                          context.read<SignInCubit>().initData();
                          context.goNamed(AppRoutes.signIn);
                        },
                        child: Text(
                          LocaleKeys.sign_in.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.avenirNextDemi,
                            color: buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.gapSpace(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
