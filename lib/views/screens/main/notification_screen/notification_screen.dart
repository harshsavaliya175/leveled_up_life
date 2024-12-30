import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/bloc/notification_cubit.dart';
import 'package:leveled_up_life/views/screens/main/notification_screen/notification_data.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: true,
          title: LocaleKeys.notifications.tr(),
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
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    context
                        .read<NotificationCubit>()
                        .getNotificationList(isLoading: false);
                  },
                  backgroundColor: primaryColor,
                  color: Colors.white,
                  child: const NotificationData(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
