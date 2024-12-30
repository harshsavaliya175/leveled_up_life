import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imagePath,
    required this.errorWidget,
    required this.loadingBuilderWidth,
    required this.loadingBuilderHeight,
    this.imageHeight,
    this.imageWidth,
    this.loadingColor = primaryColor,
  });

  final String imagePath;
  final Widget errorWidget;
  final double loadingBuilderWidth;
  final double loadingBuilderHeight;
  final double? imageHeight;
  final double? imageWidth;
  final Color loadingColor;

  @override
  Widget build(BuildContext context) {
    log('image path -> $imagePath');
    return Image.network(
      imagePath,
      fit: BoxFit.cover,
      height: imageHeight,
      width: imageWidth,
      errorBuilder: (BuildContext context, Object error, stackTrace) {
        return errorWidget;
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return SizedBox(
            width: loadingBuilderWidth,
            height: loadingBuilderHeight,
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: loadingColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
