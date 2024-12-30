import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction action;
  final TextInputType type;
  final String hintText;
  final bool? obscureText;
  final Function(String val) onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final TextStyle? hintStyle;
  final double? radius;
  final int? maxLines;
  final bool? readOnly;
  final String? initialValue;
  final Color? textColor;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.action,
    required this.type,
    required this.hintText,
    required this.onChange,
    this.suffixIcon,
    this.obscureText,
    this.prefixIcon,
    this.fillColor,
    this.textCapitalization,
    this.maxLength,
    this.hintStyle,
    this.radius,
    this.maxLines,
    this.readOnly,
    this.initialValue,
    this.textColor,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : null,
      initialValue: initialValue,
      style: TextStyle(
        fontSize: 16,
        color: textColor ?? lightBlackColor,
      ),
      cursorColor: lightBlackColor,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      keyboardType: type,
      readOnly: readOnly ?? false,
      textInputAction: action,
      maxLength: maxLength ?? TextField.noMaxLength,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      onChanged: (value) {
        onChange(value);
      },
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 12,
          right: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        hintStyle: hintStyle ??
            const TextStyle(
              fontSize: 16,
              color: lightGreyColor,
            ),
        hintText: hintText,
        prefixIcon: (prefixIcon != null)
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: prefixIcon,
              )
            : null,
        suffixIcon: (suffixIcon != null)
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 5),
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
