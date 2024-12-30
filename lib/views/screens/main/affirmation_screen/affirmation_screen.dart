import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/affirmation_data.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/bloc/affirmation_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_calendar_widget.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';
import 'package:leveled_up_life/views/widgets/common_dialog_widget.dart';

class AffirmationScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<AffirmationCubit>().loadMoreAffirmationData();
        }
      },
    );
  }

  AffirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreference preferences = si.get<SharedPreference>();
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: true,
          title: LocaleKeys.affirmation.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: BlocConsumer<AffirmationCubit, AffirmationState>(
        listener: (BuildContext context, AffirmationState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.responseItem != null && state.responseItem!.status) {
            context.pop();
            context
                .read<AffirmationCubit>()
                .getAffirmationList(date: state.date);
          }
          if (state.isForceLogout) {
            context.forceLogout();
          }
        },
        builder: (BuildContext context, AffirmationState state) {
          return Column(
            children: [
              AppCalendarWidget(
                onTap: (String date) {
                  context
                      .read<AffirmationCubit>()
                      .getAffirmationList(date: date);
                },
              ),
              28.gapSpace(),
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
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
                        12.gapSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.affirmation_list.tr(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: FontFamily.avenirNextDemi,
                                color: primaryColor,
                              ),
                            ),
                            AppButton(
                              onTap: () {
                                context
                                    .read<AffirmationCubit>()
                                    .changeData(addAffirmationText: '');
                                context.showAppDialog(
                                  contentWidget: CommonDialogWidget(
                                    addEditTap: () {
                                      context
                                          .read<AffirmationCubit>()
                                          .addAffirmationButton();
                                    },
                                    titleText: LocaleKeys.add_affirmation.tr(),
                                    isVisibleImagePicker: false,
                                    cancelTap: () {
                                      context.pop();
                                    },
                                    onChange: (String val) {
                                      context
                                          .read<AffirmationCubit>()
                                          .changeData(addAffirmationText: val);
                                    },
                                  ),
                                );
                              },
                              buttonBorderRadius: 6,
                              child: Text(
                                LocaleKeys.add_new.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.avenirNextMedium,
                                  color: Colors.white,
                                ),
                              ).paddingSymmetric(horizontal: 20, vertical: 10),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20),
                        20.gapSpace(),
                        const Divider(
                          color: dividerColor,
                          thickness: 1,
                          height: 0,
                        ),
                        AffirmationData(scrollController: scrollController),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
