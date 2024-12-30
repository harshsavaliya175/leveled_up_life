import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/grateful_screen/bloc/grateful_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';

class CommonDialogWidget extends StatelessWidget {
  final String titleText;
  final String initialValue;
  final bool isVisibleImagePicker;
  final VoidCallback cancelTap;
  final Function(String val) onChange;
  final VoidCallback addEditTap;
  final VoidCallback? pickImage;
  final bool isEdit;

  const CommonDialogWidget({
    super.key,
    required this.titleText,
    required this.isVisibleImagePicker,
    required this.cancelTap,
    required this.onChange,
    required this.addEditTap,
    this.pickImage,
    this.isEdit = false,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  titleText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamily.avenirNextDemi,
                    color: primaryColor,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Ink(
                  decoration: BoxDecoration(
                    color: bottomSheetCancelButtonColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      cancelTap();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: Assets.icons.icCancel.svg(fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
              ),
            ],
          ).paddingAll(20),
          const Divider(height: 0, color: dividerColor, thickness: 1),
          20.gapSpace(),
          AppTextField(
            fillColor: coolOneColor,
            action: TextInputAction.done,
            maxLines: 2,
            textCapitalization: TextCapitalization.sentences,
            type: TextInputType.text,
            hintText: LocaleKeys.type_something.tr(),
            initialValue: initialValue,
            onChange: (String val) {
              onChange(val);
            },
          ).paddingSymmetric(horizontal: 20),
          Visibility(
            visible: isVisibleImagePicker,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                12.gapSpace(),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [7, 5],
                  color: primaryColor,
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    color: pickImageContainerColor.withOpacity(0.1),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: pickImage,
                      child: Container(
                        height: 60,
                        width: size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.icImage.svg(
                              fit: BoxFit.scaleDown,
                            ),
                            12.gapSpace(),
                            Text(
                              LocaleKeys.upload_image.tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).paddingSymmetric(horizontal: 20),
                16.gapSpace(),
                BlocBuilder<GratefulCubit, GratefulState>(
                  builder: (BuildContext context, GratefulState state) {
                    return (state.file != null ||
                            state.gratefulImage.isNotEmpty)
                        ? Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: (state.file != null)
                                            ? FileImage(
                                                state.file ?? File(''),
                                              )
                                            : NetworkImage(state.gratefulImage)
                                                as ImageProvider,
                                      ),
                                    ),
                                  ).paddingOnly(
                                    top: 10,
                                    left: 10,
                                    bottom: 10,
                                    right: 12,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    state.file != null
                                        ? (state.file!.path.split('/').last)
                                        : state.gratefulImage.split('/').last,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: FontFamily.avenirNextRegular,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                5.gapSpace(),
                                Container(
                                  padding: EdgeInsets.zero,
                                  width: 36,
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(6),
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      context
                                          .read<GratefulCubit>()
                                          .getImageInit();
                                    },
                                    icon: Assets.icons.icDelete.svg(
                                      height: 18,
                                      width: 18,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 20)
                        : Container();
                  },
                ),
              ],
            ),
          ),
          20.gapSpace(),
          AppButton(
            fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
            onTap: () {
              addEditTap();
            },
            child: Text(
              isEdit ? LocaleKeys.save.tr() : LocaleKeys.add.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.avenirNextBold,
                color: Colors.white,
              ),
            ),
          ).paddingAll(20),
        ],
      ),
    );
  }
}
