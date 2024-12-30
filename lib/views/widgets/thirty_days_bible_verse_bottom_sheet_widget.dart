// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/core/utils/share_plus_util.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/bible_verse_model/bible_verse_model.dart';
import 'package:leveled_up_life/views/screens/main/home_screen/bloc/home_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/common_bottom_sheet_top_widget.dart';

class ThirtyDaysBibleVerseBottomSheetWidget extends StatefulWidget {
  const ThirtyDaysBibleVerseBottomSheetWidget({super.key});

  @override
  State<ThirtyDaysBibleVerseBottomSheetWidget> createState() =>
      _ThirtyDaysBibleVerseBottomSheetWidgetState();
}

class _ThirtyDaysBibleVerseBottomSheetWidgetState
    extends State<ThirtyDaysBibleVerseBottomSheetWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBibleVerse(true).then(
      (void value) {
        WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          scrollToDate(homeCubit.state.thirtyDaysBibleVerse?.day ?? 0);
        });
      },
    );
  }

  void scrollToDate(int date) {
    date -= 1;
    if (date != -1) {
      scrollController.animateTo(
        date * 50.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, HomeState state) {
        BibleVerseModel? bibleVerseModel = state.thirtyDaysBibleVerse;
        return ListView(
          shrinkWrap: true,
          children: [
            CommonBottomSheetTopWidget(
              title: LocaleKeys.thirty_days_bible_verse.tr(),
              onTap: () {
                context.pop();
              },
            ),
            20.gapSpace(),
            SizedBox(
              height: 62,
              child: ListView.separated(
                itemCount: 30,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (BuildContext context, int index) =>
                    10.gapSpace(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 62,
                    width: 46,
                    decoration: BoxDecoration(
                      color: ((bibleVerseModel?.day ?? 0) == (index + 1))
                          ? buttonColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.day.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            color: ((bibleVerseModel?.day ?? 0) == (index + 1))
                                ? Colors.white
                                : ((bibleVerseModel?.day ?? 0) > (index + 1))
                                    ? primaryColor.withOpacity(0.3)
                                    : primaryColor,
                          ),
                        ),
                        4.gapSpace(),
                        Text(
                          "${index + 1}".toString().padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.avenirNextMedium,
                            color: ((bibleVerseModel?.day ?? 0) == (index + 1))
                                ? Colors.white
                                : ((bibleVerseModel?.day ?? 0) > (index + 1))
                                    ? primaryColor.withOpacity(0.3)
                                    : primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            20.gapSpace(),
            const Divider(height: 0, color: dividerColor, thickness: 1),
            20.gapSpace(),
            Text(
              "${((bibleVerseModel?.day ?? 0)).toString().padLeft(2, "0")} ${LocaleKeys.days_verse.tr()}",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.avenirNextDemi,
                color: primaryColor,
              ),
            ).paddingSymmetric(horizontal: 20),
            12.gapSpace(),
            Text(
              bibleVerseModel?.title ?? '',
              style: const TextStyle(
                fontSize: 20,
                color: primaryColor,
              ),
            ).paddingSymmetric(horizontal: 20),
            20.gapSpace(),
            AppButton(
              fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
              onTap: () async {
                if ((bibleVerseModel?.title.isNotEmpty ?? false)) {
                  String text = "${bibleVerseModel!.title}\n\n$storeLink";
                  await SharePlusUtil()
                      .shareTextOrImage(
                    shareText: text,
                    shareImageUrl: '',
                  )
                      .then(
                    (void value) {
                      context
                          .read<HomeCubit>()
                          .addShareBibleVerseText(bibleVerseModel?.title ?? "");
                    },
                  );
                  context.pop();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.icShare.svg(
                    height: 20,
                    width: 16,
                    fit: BoxFit.scaleDown,
                  ),
                  6.gapSpace(),
                  Text(
                    LocaleKeys.share.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.avenirNextBold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ).paddingAll(20),
          ],
        );
      },
    );
  }
}
