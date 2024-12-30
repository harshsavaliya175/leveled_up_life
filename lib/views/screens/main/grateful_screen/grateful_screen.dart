import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/image_picker_util_only_image.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/bloc/grateful_cubit.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/grateful_data.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_calendar_widget.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';
import 'package:leveled_up_life/views/widgets/common_dialog_widget.dart';

class GratefulScreen extends StatelessWidget {
  GratefulScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<GratefulCubit>().loadMoreGratefulData();
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
          title: LocaleKeys.grateful.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: BlocConsumer<GratefulCubit, GratefulState>(
        listener: (BuildContext context, GratefulState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.responseItem != null && state.responseItem!.status) {
            context.pop();
            context.read<GratefulCubit>().getGratefulList(date: state.date);
          }
          if (state.isForceLogout) {
            context.forceLogout();
          }
        },
        builder: (BuildContext context, GratefulState state) {
          return Column(
            children: [
              AppCalendarWidget(
                onTap: (String date) {
                  context.read<GratefulCubit>().getGratefulList(date: date);
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
                              LocaleKeys.grateful_list.tr(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: FontFamily.avenirNextDemi,
                                color: primaryColor,
                              ),
                            ),
                            AppButton(
                              onTap: () async {
                                context
                                    .read<GratefulCubit>()
                                    .gratefulDialogInit();
                                await context.showAppDialog(
                                  contentWidget: CommonDialogWidget(
                                    titleText: LocaleKeys.add_grateful.tr(),
                                    isVisibleImagePicker: true,
                                    cancelTap: () {
                                      context.pop();
                                    },
                                    pickImage: () {
                                      if (isPurchase) {
                                        PickImageOnly().openImageChooser(
                                          context: context,
                                          onImageChose: (File? image) {
                                            context
                                                .read<GratefulCubit>()
                                                .changeData(file: image);
                                          },
                                        );
                                      } else {
                                        // context.showAppSnackBar(
                                        //   message: LocaleKeys.subscriptionReqTxt
                                        //       .tr(),
                                        // );
                                        context.gotoSubscriptionScreen();
                                      }
                                    },
                                    addEditTap: () async {
                                      context
                                          .read<GratefulCubit>()
                                          .addEditGratefulButton();
                                    },
                                    onChange: (String val) {
                                      context
                                          .read<GratefulCubit>()
                                          .changeData(addGratefulText: val);
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
                        BlocBuilder<GratefulCubit, GratefulState>(
                          builder: (BuildContext context, GratefulState state) {
                            return Expanded(
                              child: state.gratefulModelList.isEmpty
                                  ? Center(
                                      child: Text(
                                        LocaleKeys.no_grateful_data.tr(),
                                        style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  : GratefulData(
                                      scrollController: scrollController,
                                    ),
                            );
                          },
                        ),
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
