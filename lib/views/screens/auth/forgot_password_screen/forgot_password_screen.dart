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
import 'package:leveled_up_life/views/screens/auth/reset_password_screen/bloc/reset_password_cubit.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    Size size = context.getScreenSize;
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (BuildContext context, ForgotPasswordState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(
            message: state.message,
            backgroundColor: Colors.white,
            textColor: primaryColor,
          );
        }
        if (state.responseItem != null && state.responseItem!.status) {
          context.read<ResetPasswordCubit>().initData();
          context.pushReplacementNamed(AppRoutes.resetPassword, extra: email);
        }
      },
      builder: (BuildContext context, ForgotPasswordState state) {
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
                    LocaleKeys.forgot_password_title.tr(),
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: FontFamily.avenirNextBold,
                    ),
                  ),
                  12.gapSpace(),
                  Text(
                    LocaleKeys.enter_your_email_and_reset_password.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: greyColor,
                    ),
                  ),
                  40.gapSpace(),
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
                      email = val;
                    },
                    action: TextInputAction.done,
                    type: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    hintText: LocaleKeys.email_address.tr(),
                    prefixIcon: Assets.icons.icMail.svg(
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  38.gapSpace(),
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
                      context.hideKeyboard();
                      context.read<ForgotPasswordCubit>().requestButton(email);
                    },
                  ),
                  24.gapSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.remember_password.tr(),
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
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
