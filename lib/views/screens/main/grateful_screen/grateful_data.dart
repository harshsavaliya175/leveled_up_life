import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/image_picker_util_only_image.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/bloc/grateful_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/common_dialog_widget.dart';

class GratefulData extends StatelessWidget {
  final ScrollController scrollController;

  const GratefulData({super.key, required this.scrollController});

  void showImageDialog({
    required BuildContext context,
    required GratefulState state,
    required String imagePath,
  }) {
    Size size = context.getScreenSize;
    context.showAppDialog(
      contentWidget: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        blendMode: BlendMode.srcIn,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: AppNetworkImage(
            imagePath: gratefulImagePath + imagePath,
            errorWidget: Assets.images.imgPlaceUser.image(fit: BoxFit.cover),
            loadingBuilderWidth: size.width,
            loadingBuilderHeight: size.height,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocBuilder<GratefulCubit, GratefulState>(
      builder: (BuildContext context, GratefulState state) {
        return ListView.separated(
          controller: scrollController,
          itemCount: state.gratefulModelList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 36,
          ),
          separatorBuilder: (BuildContext context, int index) => 12.gapSpace(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Material(
                  color: coolOneColor,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      context.read<GratefulCubit>().fillEditGratefulData(
                            addGratefulText:
                                state.gratefulModelList[index].gratefulTitle,
                            gratefulImage:
                                state.gratefulModelList[index].gratefulImg,
                          );
                      await context.showAppDialog(
                        contentWidget: CommonDialogWidget(
                          isEdit: true,
                          initialValue:
                              state.gratefulModelList[index].gratefulTitle,
                          titleText: LocaleKeys.edit_grateful.tr(),
                          isVisibleImagePicker: true,
                          cancelTap: () {
                            context.pop();
                          },
                          pickImage: () {
                            PickImageOnly().openImageChooser(
                              context: context,
                              onImageChose: (File? image) {
                                context
                                    .read<GratefulCubit>()
                                    .changeData(file: image);
                              },
                            );
                          },
                          addEditTap: () async {
                            context.read<GratefulCubit>().addEditGratefulButton(
                                  isEdit: true,
                                  gratefulId:
                                      "${state.gratefulModelList[index].gratefulId}",
                                );
                          },
                          onChange: (String val) {
                            context
                                .read<GratefulCubit>()
                                .changeData(addGratefulText: val);
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state
                                        .gratefulModelList[index].gratefulTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                    ),
                                  ),
                                  5.gapSpace(),
                                  Text(
                                    state.gratefulModelList[index].gratefulDate
                                        .format(
                                      outputFormat: 'MMMM d, yyyy',
                                      inputFormat: 'yyyy-MM-dd',
                                    ),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.gapSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Material(
                                color: coolOneColor,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () async {
                                    if (state.gratefulModelList[index]
                                        .gratefulTitle.isNotEmpty) {
                                      String text =
                                          "${state.gratefulModelList[index].gratefulTitle}\n\n$storeLink";
                                      await SharePlusUtil().shareTextOrImage(
                                        shareText: text,
                                        shareImageUrl: (state
                                                    .gratefulModelList[index]
                                                    .gratefulImg)
                                                .isEmpty
                                            ? ''
                                            : gratefulImagePath +
                                                state.gratefulModelList[index]
                                                    .gratefulImg,
                                      );
                                    }
                                  },
                                  child: Assets.icons.icShare
                                      .svg(
                                        height: 18,
                                        width: 15,
                                        colorFilter: const ColorFilter.mode(
                                          primaryColor,
                                          BlendMode.srcIn,
                                        ),
                                      )
                                      .paddingAll(5),
                                ),
                              ),
                              if (state.gratefulModelList[index].gratefulImg
                                  .isNotEmpty)
                                Row(
                                  children: [
                                    18.gapSpace(),
                                    InkWell(
                                      onTap: () {
                                        showImageDialog(
                                          context: context,
                                          state: state,
                                          imagePath: state
                                              .gratefulModelList[index]
                                              .gratefulImg,
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: AppNetworkImage(
                                          imagePath: gratefulImagePath +
                                              state.gratefulModelList[index]
                                                  .gratefulImg,
                                          errorWidget:
                                              Assets.images.imgPlaceUser.image(
                                            fit: BoxFit.cover,
                                            height: 40,
                                            width: 40,
                                          ),
                                          loadingBuilderWidth: 40,
                                          loadingBuilderHeight: 40,
                                          imageHeight: 40,
                                          imageWidth: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (state.isPaginationLoader) &&
                      (index == (state.gratefulModelList.length - 1)),
                  child: Column(
                    children: [
                      20.gapSpace(),
                      const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
