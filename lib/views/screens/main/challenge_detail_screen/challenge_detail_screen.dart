import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/bloc/challenge_details_cubit.dart';
import 'package:leveled_up_life/views/screens/main/challenge_detail_screen/challenge_detail_data.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final String? selectedUserToken;

  const ChallengeDetailScreen({super.key, this.selectedUserToken = ''});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    String? userToken = preferences.getString(SharedPreference.userToken);
    Size size = context.getScreenSize;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log('===>  $didPop');
        if (didPop) {
          return;
        }
        context.pop(context.read<ChallengeDetailsCubit>().state.challengeModel);
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: BlocConsumer<ChallengeDetailsCubit, ChallengeDetailsState>(
            listener: (BuildContext context, ChallengeDetailsState state) {
              if (state.message.isNotEmpty) {
                context.showAppSnackBar(message: state.message);
              }
              if (state.isForceLogout) {
                context.forceLogout();
              }
            },
            builder: (BuildContext context, ChallengeDetailsState state) {
              return CommonAppBar(
                displayLeading: true,
                title: LocaleKeys.details.tr(),
                onTap: () {
                  context.pop(state.challengeModel);
                },
              );
            },
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
            child: ChallengeDetailData(selectedUserToken: selectedUserToken),
          ),
        ),
      ),
    );
  }
}
