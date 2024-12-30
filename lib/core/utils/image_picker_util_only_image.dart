// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageOnly {
  void openImageChooser(
      {required BuildContext context,
      required Function(File? image) onImageChose}) {
    FocusScope.of(context).unfocus();
    Platform.isIOS
        ? showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Wrap(
                  children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      title: Text(LocaleKeys.gallery.tr()),
                      leading: const Icon(Icons.photo_library),
                      onTap: () async {
                        await _imageFormGallery(
                            context: context,
                            onImageChose: (File? image) {
                              onImageChose(image);
                            }).then((bool value) {
                          if (value) {
                            context.pop();
                          } else {
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(LocaleKeys
                                  .without_permission_do_not_change_picture
                                  .tr()),
                              backgroundColor: primaryColor,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        });
                      },
                    ),
                    ListTile(
                      title: Text(LocaleKeys.camera.tr()),
                      leading: const Icon(Icons.photo_camera),
                      onTap: () {
                        _imageFromCamera(
                            context: context,
                            onImageChose: (File? image) {
                              onImageChose(image);
                            });
                        context.pop();
                      },
                    ),
                  ],
                ),
              );
            },
          )
        : showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text(LocaleKeys.select_image.tr()),
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                children: [
                  ListTile(
                    title: Text(LocaleKeys.photo_library.tr()),
                    leading: const Icon(Icons.photo_library),
                    onTap: () async {
                      await _imageFormGallery(
                          context: context,
                          onImageChose: (File? image) {
                            onImageChose(image);
                          }).then((value) {
                        if (value) {
                          context.pop();
                        } else {
                          context.pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              LocaleKeys
                                  .without_permission_do_not_change_picture
                                  .tr(),
                            ),
                            action: SnackBarAction(
                              label: LocaleKeys.setting.tr(),
                              textColor: Colors.white,
                              onPressed: () {
                                openAppSettings();
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                            backgroundColor: primaryColor,
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      });
                    },
                  ),
                  ListTile(
                    title: Text(LocaleKeys.camera.tr()),
                    leading: const Icon(Icons.photo_camera),
                    onTap: () {
                      _imageFromCamera(
                          context: context,
                          onImageChose: (File? image) {
                            onImageChose(image);
                          });
                      context.pop();
                    },
                  ),
                ],
              );
            },
          );
  }

  Future<bool> _imageFormGallery(
      {required BuildContext context,
      required Function(File? image) onImageChose}) async {
    PermissionStatus status = await Permission.storage.request();
    if (Platform.isAndroid) {
      XFile? pickedFile = await ImagePicker()
          .pickImage(imageQuality: 100, source: ImageSource.gallery);
      if (pickedFile != null) {
        onImageChose(File(pickedFile.path));
      }
      return true;
    } else {
      if (status.isGranted) {
        XFile? pickedFile = await ImagePicker()
            .pickImage(imageQuality: 100, source: ImageSource.gallery);
        if (pickedFile != null) {
          onImageChose(File(pickedFile.path));
        }
        return true;
      } else if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            LocaleKeys.without_permission_do_not_change_picture.tr(),
          ),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
        ));
        return false;
      } else if (status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          content: Text(
            LocaleKeys
                .to_access_this_feature_please_grant_permission_from_settings
                .tr(),
          ),
        ));
        return false;
      }
    }
    return false;
  }

  Future<bool> _imageFromCamera(
      {required BuildContext context,
      required Function(File? image) onImageChose}) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if (pickedFile != null) {
        onImageChose(File(pickedFile.path));
      }
      return true;
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(LocaleKeys.without_permission_do_not_change_picture.tr()),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          content: Text(LocaleKeys
              .to_access_this_feature_please_grant_permission_from_settings
              .tr()),
        ),
      );
      return false;
    }
    return false;
  }
}
