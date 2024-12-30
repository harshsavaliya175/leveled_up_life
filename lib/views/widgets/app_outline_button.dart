import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

class AppOutlineButton extends StatelessWidget {
  final VoidCallback onTap;

  final Widget child;
  final WidgetStateProperty<Size?>? fixedSize;
  final double buttonBorderRadius;

  final Color? borderColor;
  final BorderSide borderSide;

  const AppOutlineButton({
    super.key,
    required this.onTap,
    required this.child,
    this.fixedSize,
    this.buttonBorderRadius = 12,
    this.borderColor,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(primaryColor.withOpacity(0.5)),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        fixedSize: fixedSize,
        side: WidgetStatePropertyAll(
            BorderSide(color: borderColor ?? primaryColor, width: 2)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            side: borderSide,
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: child,
    );
  }
}
