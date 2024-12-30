import 'package:flutter/material.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';

class CommonSuffixIcon extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onTap;

  const CommonSuffixIcon({
    super.key,
    required this.isVisible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: (isVisible)
          ? Assets.icons.icVisibility.svg(fit: BoxFit.scaleDown)
          : Assets.icons.icVisibilityOff.svg(fit: BoxFit.scaleDown),
    );
  }
}
