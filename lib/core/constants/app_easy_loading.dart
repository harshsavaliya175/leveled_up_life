import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 50.0
    ..radius = 10.0
    ..backgroundColor = primaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false;
}
