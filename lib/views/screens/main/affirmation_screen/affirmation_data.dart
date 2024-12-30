import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/affirmation_screen/bloc/affirmation_cubit.dart';

class AffirmationData extends StatelessWidget {
  final ScrollController scrollController;

  const AffirmationData({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocBuilder<AffirmationCubit, AffirmationState>(
      builder: (BuildContext context, AffirmationState state) {
        return Expanded(
          child: state.affirmationModelList.isEmpty
              ? Center(
                  child: Text(
                    LocaleKeys.no_affirmation_data.tr(),
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: state.affirmationModelList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 36,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      12.gapSpace(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: coolOneColor,
                          ),
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.affirmationModelList[index]
                                            .affirmationTitle,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: primaryColor,
                                        ),
                                      ),
                                      5.gapSpace(),
                                      Text(
                                        state.affirmationModelList[index]
                                            .affirmationDate
                                            .format(
                                                outputFormat: 'MMMM d, yyyy',
                                                inputFormat: 'yyyy-MM-dd'),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              10.gapSpace(),
                              Material(
                                color: coolOneColor,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () async {
                                    if (state.affirmationModelList[index]
                                        .affirmationTitle.isNotEmpty) {
                                      String text =
                                          "${state.affirmationModelList[index].affirmationTitle}\n\n$storeLink";
                                      await SharePlusUtil().shareTextOrImage(
                                        shareText: text,
                                        shareImageUrl: '',
                                      );
                                    }
                                  },
                                  child: Assets.icons.icShare
                                      .svg(
                                        height: 18,
                                        width: 15,
                                        colorFilter: const ColorFilter.mode(
                                          primaryColor,
                                          BlendMode.srcIn,
                                        ),
                                      )
                                      .paddingAll(5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: (state.isPaginationLoader) &&
                              (index ==
                                  (state.affirmationModelList.length - 1)),
                          child: Column(
                            children: [
                              20.gapSpace(),
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
