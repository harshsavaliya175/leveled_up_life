import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';

class TaskCheckVerifyDialog extends StatelessWidget {
  const TaskCheckVerifyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    SharedPreference preferences = si.get<SharedPreference>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.did_you_fail_to_remember_to_check_the_boxes.tr(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: FontFamily.avenirNextMedium,
              color: primaryColor,
            ),
          ),
          20.gapSpace(),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  fixedSize: WidgetStatePropertyAll(Size(size.width, 50)),
                  appButtonColor: primaryColor,
                  onTap: () {
                    context.pop();
                    context.read<HomeCubit>().checkChallenge(false);
                    UserModel? user = preferences.getUserModel();
                    if (user != null) {
                      user = user.copyWith(isChallenge: 0, isBibleVerse: 0);
                      preferences.saveUserModel(user);
                    }
                    context
                        .read<ThirtyDaysChallengesCubit>()
                        .getChallengeRequestList();
                    // context.read<HomeCubit>().changeData(dayIndex: 1);
                  },
                  child: Text(
                    LocaleKeys.fail_to_complete.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.avenirNextDemi,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              10.gapSpace(),
              Expanded(
                child: AppButton(
                  fixedSize: WidgetStatePropertyAll(Size(size.width, 50)),
                  appButtonColor: primaryColor,
                  onTap: () {
                    context.pop();
                    context.read<HomeCubit>().checkChallenge(true);
                    UserModel? user = preferences.getUserModel();
                    if (user != null) {
                      user = user.copyWith(isChallenge: 0);
                      preferences.saveUserModel(user);
                    }
                  },
                  child: Text(
                    LocaleKeys.forgot_to_check.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.avenirNextDemi,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
