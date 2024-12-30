import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/views/widgets/app_blur_icon_button.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final bool displayLeading;
  final List<Widget>? actionWidget;

  final VoidCallback? onTap;

  const CommonAppBar({
    super.key,
    required this.title,
    required this.displayLeading,
    this.actionWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: primaryColor,
      centerTitle: false,
      leadingWidth: (displayLeading) ? 64 : 20,
      leading: Visibility(
        visible: displayLeading,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 5, bottom: 5),
          child: AppBlurIconButton(
            onTap: () {
              if (onTap != null) {
                onTap!();
              } else {
                context.pop();
              }
            },
            child: Assets.icons.icBack.svg(fit: BoxFit.scaleDown),
          ),
        ),
      ),
      titleSpacing: (displayLeading) ? 16 : 0,
      actions: actionWidget ?? [],
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: FontFamily.avenirNextDemi,
          color: Colors.white,
        ),
      ),
    );
  }
}
