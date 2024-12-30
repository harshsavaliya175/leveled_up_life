import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      constraints: const BoxConstraints(),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      icon: child,
      padding: EdgeInsets.zero,
    );
  }
}
