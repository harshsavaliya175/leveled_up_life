import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/image_picker_util_only_image.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/edit_profile_screen/bloc/edit_profile_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/app_floating_action_button.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';
import 'package:leveled_up_life/views/widgets/app_text_field.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (BuildContext context, EditProfileState state) {
        if (state.message.isNotEmpty) {
          context.showAppSnackBar(message: state.message);
        }
        if (state.responseItem != null && state.responseItem!.status) {
          context.pop();
        }
        if (state.isForceLogout) {
          context.forceLogout();
        }
      },
      builder: (BuildContext context, EditProfileState state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppBar(
              title: LocaleKeys.edit_profile.tr(),
              displayLeading: true,
            ),
          ),
          backgroundColor: primaryColor,
          body: Column(
            children: [
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (BuildContext context, EditProfileState state) {
                  return Center(
                    child: Stack(
                      alignment: const Alignment(1, 1),
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: (state.file != null)
                                ? Image.file(
                                    state.file ?? File(''),
                                    fit: BoxFit.cover,
                                  )
                                : state.profilePictureImg != ''
                                    ? AppNetworkImage(
                                        imagePath: state.profilePictureImg,
                                        errorWidget: Assets.images.imgPlaceUser
                                            .image(fit: BoxFit.cover),
                                        loadingBuilderWidth: 150,
                                        loadingBuilderHeight: 150,
                                      )
                                    : Assets.images.imgPlaceUser.image(
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: AppFloatingActionButton(
                            onPressed: () {
                              PickImageOnly().openImageChooser(
                                context: context,
                                onImageChose: (File? image) {
                                  context
                                      .read<EditProfileCubit>()
                                      .changeData(file: image);
                                },
                              );
                            },
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Assets.icons.icCamera.svg(
                              height: 16,
                              width: 16,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              40.gapSpace(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.gapSpace(),
                        Center(
                          child: Container(
                            height: 5,
                            width: 70,
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ListView(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              children: [
                                12.gapSpace(),
                                Text(
                                  LocaleKeys.full_name.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                  ),
                                ),
                                8.gapSpace(),
                                AppTextField(
                                  radius: 12,
                                  fillColor: coolOneColor,
                                  action: TextInputAction.next,
                                  prefixIcon: Assets.icons.icUser.svg(
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  type: TextInputType.text,
                                  hintText: LocaleKeys.enter_name.tr(),
                                  textColor: primaryColor,
                                  initialValue: state.name,
                                  onChange: (String val) {
                                    context
                                        .read<EditProfileCubit>()
                                        .changeData(name: val);
                                  },
                                ),
                                20.gapSpace(),
                                Text(
                                  LocaleKeys.email_address.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextMedium,
                                  ),
                                ),
                                8.gapSpace(),
                                AppTextField(
                                  radius: 12,
                                  fillColor: coolOneColor,
                                  action: TextInputAction.done,
                                  prefixIcon: Assets.icons.icMail.svg(
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  readOnly: true,
                                  initialValue: state.email,
                                  textColor: lightBlackColor.withOpacity(0.7),
                                  type: TextInputType.emailAddress,
                                  hintText: LocaleKeys.enter_email.tr(),
                                  onChange: (String val) {},
                                ),
                                48.gapSpace(),
                                AppButton(
                                  fixedSize: WidgetStatePropertyAll(
                                      Size(size.width, 60)),
                                  onTap: () {
                                    context.hideKeyboard();
                                    context
                                        .read<EditProfileCubit>()
                                        .editProfileButton();
                                  },
                                  child: Text(
                                    LocaleKeys.save_change.tr(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: FontFamily.avenirNextBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
