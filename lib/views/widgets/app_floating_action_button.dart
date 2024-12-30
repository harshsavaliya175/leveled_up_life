import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool mini;
  final double? elevation;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final Widget child;
  final String? heroTag;

  const AppFloatingActionButton({
    super.key,
    required this.onPressed,
    this.mini = false,
    this.elevation,
    this.backgroundColor,
    this.shape,
    required this.child,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
      },
      mini: mini,
      elevation: elevation,
      backgroundColor: backgroundColor,
      shape: shape,
      heroTag: heroTag,
      child: child,
    );
  }
}
