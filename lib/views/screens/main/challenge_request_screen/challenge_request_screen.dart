import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/bloc/challenge_request_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenge_request_screen/challenge_request_data.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ChallengeRequestScreen extends StatelessWidget {
  ChallengeRequestScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<ChallengeRequestCubit>().loadMoreChallengeRequestData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    scrollControllerListener(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: true,
          title: LocaleKeys.challenge_request.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                    ChallengeRequestData(controller: scrollController),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
