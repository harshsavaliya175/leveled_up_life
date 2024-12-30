import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/models/response_model/participate_model/participate_model.dart';
import 'package:leveled_up_life/views/widgets/app_network_image.dart';

class CommonImageStackWidget extends StatelessWidget {
  final List<ParticipateModel> participateList;

  const CommonImageStackWidget({
    super.key,
    required this.participateList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        (participateList.length) > 5 ? 5 : participateList.length,
        (int index) => Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: (participateList[index].userProfilePhoto?.isNotEmpty ??
                        false)
                    ? AppNetworkImage(
                        imagePath: profileImagePath +
                            participateList[index].userProfilePhoto!,
                        errorWidget: Assets.images.imgPlaceUser.image(
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        loadingBuilderWidth: 30,
                        loadingBuilderHeight: 30,
                        imageWidth: 30,
                        imageHeight: 30,
                      )
                    : Assets.images.imgPlaceUser.image(
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
              ),
              index == 4
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Text(
                          "+${participateList.length - 5}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: FontFamily.avenirNextMedium,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ).paddingOnly(left: index * 20),
      ),
    );
  }
}
