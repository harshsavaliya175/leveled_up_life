import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';

class CommonSubscriptionDetailTile extends StatelessWidget {
  final String title;

  const CommonSubscriptionDetailTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: const BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 10,
          ),
        ),
        12.gapSpace(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: primaryColor,
          ),
        ),
      ],
    ).paddingOnly(bottom: 21);
  }
}
