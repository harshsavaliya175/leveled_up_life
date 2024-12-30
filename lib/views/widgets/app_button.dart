import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;

  final Widget child;
  final WidgetStateProperty<Size?>? fixedSize;
  final double buttonBorderRadius;

  final Color? appButtonColor;
  final BorderSide borderSide;

  const AppButton({
    super.key,
    required this.onTap,
    required this.child,
    this.fixedSize,
    this.buttonBorderRadius = 12,
    this.appButtonColor,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: const WidgetStatePropertyAll(Colors.white24),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        fixedSize: fixedSize,
        backgroundColor: WidgetStatePropertyAll(appButtonColor ?? buttonColor),
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
