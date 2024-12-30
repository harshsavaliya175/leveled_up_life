import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';

import '../../core/constants/app_colors.dart';

class CommonBottomSheetTopWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CommonBottomSheetTopWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.gapSpace(),
        Center(
          child: Container(
            height: 5,
            width: 70,
            decoration: BoxDecoration(
              color: bottomSheetHandleColor,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
        12.gapSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontFamily.avenirNextDemi,
                color: primaryColor,
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                color: bottomSheetCancelButtonColor.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  onTap();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: Assets.icons.icCancel.svg(fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
        12.gapSpace(),
        const Divider(
          color: dividerColor,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
