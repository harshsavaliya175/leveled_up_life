import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/models/response_model/thirty_days_challenge_model/thirty_days_challenge_model.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_check_box.dart';

class ThirtyDaysChallengesData extends StatelessWidget {
  const ThirtyDaysChallengesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<ThirtyDaysChallengesCubit, ThirtyDaysChallengesState>(
        listener: (BuildContext context, ThirtyDaysChallengesState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.isForceLogout) {
            context.forceLogout();
          }
        },
        builder: (BuildContext context, ThirtyDaysChallengesState state) {
          return ListView.separated(
            itemCount: state.thirtyDaysDataModel?.challengeList.length ?? 0,
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 40,
              left: 20,
              right: 20,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                16.gapSpace(),
            itemBuilder: (BuildContext context, int index) {
              ThirtyDaysChallengeModel? challengeModel =
                  state.thirtyDaysDataModel?.challengeList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  color: coolOneColor,
                  child: InkWell(
                    splashColor: acceptColor.withOpacity(0.5),
                    onTap: () async {
                      if (!((challengeModel?.isComplete) == 1)) {
                        bool isComplete = await context
                            .read<ThirtyDaysChallengesCubit>()
                            .completeDailyChallenge(
                                challengeModel?.daysChallengeId ?? 0);
                        if (isComplete) {
                          context
                              .read<ThirtyDaysChallengesCubit>()
                              .getChallengeRequestList(
                                  index: state.selectedIndex ?? 0);
                        }
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: ((challengeModel?.isComplete ?? 0) == 1)
                                ? chartCompleteColor
                                : buttonColor,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              challengeModel?.title ?? '',
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontFamily: FontFamily.avenirNextMedium,
                              ),
                            ),
                          ),
                          5.gapSpace(),
                          AppCheckBox(
                            checkBoxValue: ((challengeModel?.isComplete) == 1),
                            onChanged: (value) async {
                              if (!((challengeModel?.isComplete) == 1)) {
                                bool isComplete = await context
                                    .read<ThirtyDaysChallengesCubit>()
                                    .completeDailyChallenge(
                                        challengeModel?.daysChallengeId ?? 0);

                                if (isComplete) {
                                  context
                                      .read<ThirtyDaysChallengesCubit>()
                                      .getChallengeRequestList(
                                          index: state.selectedIndex ?? 0);
                                }
                              }
                            },
                            activeColor: acceptColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
