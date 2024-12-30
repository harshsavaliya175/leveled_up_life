import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/main/change_password_screen/bloc/change_password_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';
import 'package:leveled_up_life/views/widgets/common_password_suffix_icon.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (BuildContext context, ChangePasswordState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.responseItem != null && state.responseItem!.status) {
          context.read<SignInCubit>().initData();
          context.goNamed(AppRoutes.signIn);
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, ChangePasswordState state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppBar(
              title: LocaleKeys.change_password.tr(),
              displayLeading: true,
            ),
          ),
          backgroundColor: primaryColor,
          body: Container(
            height: size.height,
            width: size.width,
            margin: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.gapSpace(),
                  Center(
                    child: Container(
                      height: 5,
                      width: 70,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          12.gapSpace(),
                          Text(
                            LocaleKeys.old_password.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: FontFamily.avenirNextMedium,
                            ),
                          ),
                          8.gapSpace(),
                          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                            buildWhen: (ChangePasswordState previous,
                                ChangePasswordState current) {
                              return previous.oldPasswordVisibility !=
                                  current.oldPasswordVisibility;
                            },
                            builder: (BuildContext context,
                                ChangePasswordState state) {
                              return AppTextField(
                                radius: 12,
                                fillColor: coolOneColor,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                obscureText: !(state.oldPasswordVisibility),
                                hintText: LocaleKeys.enter_old_password.tr(),
                                suffixIcon: CommonSuffixIcon(
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .changeData(
                                            oldPasswordVisibility:
                                                !(state.oldPasswordVisibility));
                                  },
                                  isVisible: state.oldPasswordVisibility,
                                ),
                                onChange: (String val) {
                                  context
                                      .read<ChangePasswordCubit>()
                                      .changeData(oldPassword: val);
                                },
                              );
                            },
                          ),
                          20.gapSpace(),
                          Text(
                            LocaleKeys.new_password.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: FontFamily.avenirNextMedium,
                            ),
                          ),
                          8.gapSpace(),
                          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                            buildWhen: (ChangePasswordState previous,
                                ChangePasswordState current) {
                              return previous.newPasswordVisibility !=
                                  current.newPasswordVisibility;
                            },
                            builder: (BuildContext context,
                                ChangePasswordState state) {
                              return AppTextField(
                                radius: 12,
                                fillColor: coolOneColor,
                                action: TextInputAction.next,
                                type: TextInputType.text,
                                hintText: LocaleKeys.enter_new_password.tr(),
                                obscureText: !(state.newPasswordVisibility),
                                suffixIcon: CommonSuffixIcon(
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .changeData(
                                            newPasswordVisibility:
                                                !(state.newPasswordVisibility));
                                  },
                                  isVisible: state.newPasswordVisibility,
                                ),
                                onChange: (String val) {
                                  context
                                      .read<ChangePasswordCubit>()
                                      .changeData(newPassword: val);
                                },
                              );
                            },
                          ),
                          20.gapSpace(),
                          Text(
                            LocaleKeys.confirm_password.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: FontFamily.avenirNextMedium,
                            ),
                          ),
                          8.gapSpace(),
                          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                            buildWhen: (ChangePasswordState previous,
                                ChangePasswordState current) {
                              return previous.confirmPasswordVisibility !=
                                  current.confirmPasswordVisibility;
                            },
                            builder: (BuildContext context,
                                ChangePasswordState state) {
                              return AppTextField(
                                radius: 12,
                                fillColor: coolOneColor,
                                action: TextInputAction.done,
                                type: TextInputType.text,
                                hintText: LocaleKeys.re_enter_new_password.tr(),
                                obscureText: !(state.confirmPasswordVisibility),
                                suffixIcon: CommonSuffixIcon(
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .changeData(
                                            confirmPasswordVisibility: !(state
                                                .confirmPasswordVisibility));
                                  },
                                  isVisible: state.confirmPasswordVisibility,
                                ),
                                onChange: (String val) {
                                  context
                                      .read<ChangePasswordCubit>()
                                      .changeData(confirmPassword: val);
                                },
                              );
                            },
                          ),
                          48.gapSpace(),
                          AppButton(
                            fixedSize:
                                WidgetStatePropertyAll(Size(size.width, 60)),
                            onTap: () {
                              context.hideKeyboard();
                              context
                                  .read<ChangePasswordCubit>()
                                  .changePasswordButton();
                            },
                            child: Text(
                              LocaleKeys.change.tr(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: FontFamily.avenirNextBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
