import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';

class AppDrawerItem extends StatelessWidget {
  const AppDrawerItem({
    super.key,
    required this.leading,
    required this.title,
    this.itemColor,
    required this.onTap,
  });

  final Widget leading;
  final String title;
  final Color? itemColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          color: itemColor ?? primaryColor,
          fontSize: 16,
          fontFamily: FontFamily.avenirNextMedium,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: primaryColor,
        size: 18,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
