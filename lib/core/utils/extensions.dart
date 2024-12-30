import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/service_injector.dart';
import 'package:leveled_up_life/views/screens/auth/sign_in_screen/bloc/sign_in_cubit.dart';
import 'package:leveled_up_life/views/screens/main/subscription_screen/bloc/subscription_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

extension NumExtension on num {
  Gap gapSpace({double? crossAxisExtent}) {
    return Gap(
      toDouble(),
      crossAxisExtent: crossAxisExtent,
    );
  }
}

extension StringExtension on String {
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  String format({required String outputFormat, required String inputFormat}) {
    DateTime dateTime = DateTime.now();
    dateTime = DateFormat(inputFormat).parse(this);
    return DateFormat(outputFormat).format(dateTime);
  }

  void launchUrlFun() async {
    await launchUrl(Uri.parse(this));
  }

  String formatTimeDifference(String notificationTime) {
    DateTime currentDateTime = DateTime.parse(this);
    DateTime notificationDateTime = DateTime.parse(notificationTime);
    Duration difference = currentDateTime.difference(notificationDateTime);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${difference.inSeconds == 1 ? LocaleKeys.second.tr() : LocaleKeys.seconds.tr()} ${LocaleKeys.ago.tr()}';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? LocaleKeys.minute.tr() : LocaleKeys.minutes.tr()} ${LocaleKeys.ago.tr()}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? LocaleKeys.hour.tr() : LocaleKeys.hours.tr()} ${LocaleKeys.ago.tr()}';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} ${difference.inDays == 1 ? LocaleKeys.day_small.tr() : LocaleKeys.days_small.tr()} ${LocaleKeys.ago.tr()}';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? LocaleKeys.month_small.tr() : LocaleKeys.months.tr()} ${LocaleKeys.ago.tr()}';
    } else {
      int years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? LocaleKeys.year.tr() : LocaleKeys.years.tr()} ${LocaleKeys.ago.tr()}';
    }
  }
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

  void hideKeyboard() {
    return FocusScope.of(this).requestFocus(FocusNode());
  }

  gotoSubscriptionScreen() {
    this.pushNamed(AppRoutes.subscription);
    this.read<SubscriptionCubit>().initData();
    this
        .read<SubscriptionCubit>()
        .initializeInAppPurchase(isCallInitStore: true);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnackBar({
    required String message,
    Color? backgroundColor,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: textColor ?? Colors.white,
          ),
        ),
        backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future showAppDialog({
    Widget? titleWidget,
    required Widget contentWidget,
    List<Widget>? actionWidget,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          titlePadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: titleWidget ?? Container(),
          content: contentWidget,
          actions: actionWidget ?? [],
        );
      },
    );
  }

  Future showAppBottomSheet({
    required Widget contentWidget,
  }) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return contentWidget;
      },
    );
  }

  forceLogout() async {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
    hideKeyboard();
    (this).read<SignInCubit>().initData();
    si.get<SharedPreference>().clearUserInfo();
    (this).goNamed(AppRoutes.signIn);
    isPurchase = false;
  }
}
