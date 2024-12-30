import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/challenge_task_model/challenge_task_model.dart';

class ChallengeRequestWidget extends StatelessWidget {
  final String challengeTitle;
  final String challengeDuration;
  final List<ChallengeTaskModel> taskList;
  final VoidCallback onTapForReject;
  final VoidCallback onTapForAccept;

  const ChallengeRequestWidget({
    super.key,
    required this.challengeTitle,
    required this.challengeDuration,
    required this.onTapForReject,
    required this.onTapForAccept,
    required this.taskList,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: coolFiftyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.gapSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                challengeTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: FontFamily.avenirNextMedium,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Text(
            taskList.first.challengeTaskName ?? '',
            style: const TextStyle(
              color: primaryColor,
              fontFamily: FontFamily.avenirNextRegular,
            ),
          ).paddingSymmetric(horizontal: 16),
          if ((taskList.length) > 1)
            Text(
              LocaleKeys.plus_task.tr(args: ["${taskList.length - 1}"]),
              style: const TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontFamily: FontFamily.avenirNextRegular,
              ),
            ).paddingSymmetric(horizontal: 16),
          12.gapSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Assets.icons.icWatch.svg(fit: BoxFit.scaleDown),
                12.gapSpace(),
                Text(
                  challengeDuration,
                  style: const TextStyle(
                    fontSize: 16,
                    color: lightGreyColor,
                  ),
                ),
              ],
            ),
          ),
          20.gapSpace(),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Material(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(12)),
                  color: Colors.transparent,
                  child: Ink(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(12)),
                      border: Border(top: BorderSide(color: borderColor)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12)),
                      onTap: () {
                        onTapForReject();
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.reject.tr(),
                          style: const TextStyle(
                            color: rejectColor,
                            fontSize: 16,
                            fontFamily: FontFamily.avenirNextMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Material(
                  color: Colors.transparent,
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(12)),
                  child: Ink(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(12)),
                      border: Border(
                        top: BorderSide(color: borderColor),
                        left: BorderSide(color: borderColor),
                      ),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12)),
                      onTap: () {
                        onTapForAccept();
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.accept.tr(),
                          style: const TextStyle(
                            color: acceptColor,
                            fontSize: 16,
                            fontFamily: FontFamily.avenirNextMedium,
                          ),
                        ),
                      ),
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
