import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final VoidCallback onPressed;
  final String? fontFamily;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
