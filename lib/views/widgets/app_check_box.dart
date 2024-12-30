import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool? checkBoxValue;
  final void Function(bool? value) onChanged;
  final Color activeColor;

  const AppCheckBox({
    super.key,
    required this.checkBoxValue,
    required this.onChanged,
    this.activeColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 18,
      child: Checkbox(
        value: checkBoxValue,
        activeColor: activeColor,
        shape: const CircleBorder(),
        side: const BorderSide(color: primaryColor, width: 1),
        onChanged: (bool? value) => onChanged(value),
      ),
    );
  }
}
