import 'package:flutter/material.dart';

class AppBlurIconButton extends StatelessWidget {
  final Widget child;

  final VoidCallback onTap;

  const AppBlurIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0x33E7E7E7).withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border(
                left: BorderSide(color: Colors.white.withOpacity(0.7)),
                top: BorderSide(color: Colors.white.withOpacity(0.7)),
              ),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
