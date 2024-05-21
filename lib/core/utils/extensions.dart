import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';

extension NumExtension on num {
  Gap gapSpace() {
    return Gap(toDouble());
  }
}

extension StringExtension on String {
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}

extension WidgetExtension on Widget {
  Widget paddingOnly(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  Widget paddingAll(double all) {
    return Padding(
      padding: EdgeInsets.all(all),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}

extension ContextExtension on BuildContext {
  Size get getScreenSize => MediaQuery.sizeOf(this);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(this).textTheme.headlineSmall?.copyWith(fontSize: 16),
        ),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future showAppDialog({
    Widget? titleWidget,
    required Widget contentWidget,
    required List<Widget> actionWidget,
  }) {
    return showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: titleWidget ?? Container(),
          content: contentWidget,
          actions: actionWidget,
        );
      },
    );
  }
}
