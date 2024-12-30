import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/create_new_challenge_screen/bloc/create_new_challenge_cubit.dart';
import 'package:leveled_up_life/views/screens/main/create_new_challenge_screen/create_new_challenge_form.dart';
import 'package:leveled_up_life/views/screens/main/invite_friends_screen/bloc/invite_friends_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class CreateNewChallengeScreen extends StatelessWidget {
  const CreateNewChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: true,
          title: LocaleKeys.create_new_challenge.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: [
              12.gapSpace(),
              Center(
                child: Container(
                  height: 5,
                  width: 70,
                  decoration: BoxDecoration(
                    color: bottomSheetHandleColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              const CreateNewChallengeForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<CreateNewChallengeCubit, CreateNewChallengeState>(
        listener: (BuildContext context, CreateNewChallengeState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
        },
        builder: (BuildContext context, CreateNewChallengeState state) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: AppButton(
              fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
              onTap: () {
                bool isValidate = context
                    .read<CreateNewChallengeCubit>()
                    .newChallengeValidation();
                if (isValidate) {
                  context.read<InviteFriendsCubit>().initData();
                  context.read<InviteFriendsCubit>().setChallengeData(
                        startDate: state.startDate,
                        endDate: state.endDate,
                        taskList: state.taskList,
                        challengeName: state.challengeName,
                        setReminder: state.isReminderStart,
                      );
                  context.read<InviteFriendsCubit>().getFriendList();
                  context.pushNamed(AppRoutes.inviteFriendForChallenges);
                }
              },
              child: Text(
                LocaleKeys.continue_text.tr(),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamily.avenirNextBold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
