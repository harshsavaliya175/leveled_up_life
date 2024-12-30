import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    this.title,
    required this.onTap,
    this.removeFriendText,
  });

  final String? title;
  final VoidCallback onTap;

  final Widget? removeFriendText;

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          removeFriendText ??
              Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamily.avenirNextMedium,
                  color: lightBlackColor,
                ),
                textAlign: TextAlign.center,
              ),
          20.gapSpace(),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: AppButton(
                  fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
                  appButtonColor: primaryColor,
                  onTap: () {
                    onTap();
                  },
                  child: Text(
                    LocaleKeys.yes.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.avenirNextBold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              10.gapSpace(),
              Expanded(
                flex: 4,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primaryColor),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: size.width,
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.no.tr(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamily.avenirNextBold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
