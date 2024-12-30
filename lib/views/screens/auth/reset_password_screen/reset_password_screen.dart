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
import 'package:leveled_up_life/views/screens/auth/reset_password_screen/bloc/reset_password_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_password_suffix_icon.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (BuildContext context, ResetPasswordState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(
            message: state.message,
            backgroundColor: Colors.white,
            textColor: primaryColor,
          );
        }
        if (state.responseItem != null && state.responseItem!.status) {
          context.read<SignInCubit>().initData();
          context.goNamed(AppRoutes.signIn);
        }
      },
      builder: (BuildContext context, ResetPasswordState state) {
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
                    LocaleKeys.reset_password.tr(),
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextBold,
                    ),
                  ),
                  12.gapSpace(),
                  Text(
                    LocaleKeys.reset_password_description.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: greyColor,
                    ),
                  ),
                  40.gapSpace(),
                  Text(
                    LocaleKeys.verification_code.tr(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextMedium,
                    ),
                  ),
                  8.gapSpace(),
                  AppTextField(
                    onChange: (String val) {
                      context
                          .read<ResetPasswordCubit>()
                          .changeData(verificationCode: val);
                    },
                    action: TextInputAction.next,
                    type: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    hintText: LocaleKeys.enter_verification_code.tr(),
                    prefixIcon: const Icon(
                      Icons.key_rounded,
                      color: primaryColor,
                      size: 26,
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
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    buildWhen: (ResetPasswordState previous,
                        ResetPasswordState current) {
                      return previous.passwordVisibility !=
                          current.passwordVisibility;
                    },
                    builder: (BuildContext context, ResetPasswordState state) {
                      return AppTextField(
                        onChange: (String val) {
                          context
                              .read<ResetPasswordCubit>()
                              .changeData(password: val);
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
                            context.read<ResetPasswordCubit>().changeData(
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
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    buildWhen: (ResetPasswordState previous,
                        ResetPasswordState current) {
                      return previous.confirmPasswordVisibility !=
                          current.confirmPasswordVisibility;
                    },
                    builder: (BuildContext context, ResetPasswordState state) {
                      return AppTextField(
                        onChange: (String val) {
                          context
                              .read<ResetPasswordCubit>()
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
                            context.read<ResetPasswordCubit>().changeData(
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
                      LocaleKeys.request.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.avenirNextBold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      context
                          .read<ResetPasswordCubit>()
                          .resetPasswordRequestButton(email);
                    },
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
