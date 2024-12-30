import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/bible_single_chapter_verse_model/bible_single_chapter_verse_model.dart';
import 'package:leveled_up_life/views/screens/main/chapter_read_screen/bloc/chapter_read_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ChapterReadScreen extends StatelessWidget {
  // final String title;

  ChapterReadScreen({
    super.key,
    // required this.title,
  });

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocBuilder<ChapterReadCubit, ChapterReadState>(
          builder: (BuildContext context, ChapterReadState state) {
            return CommonAppBar(
              displayLeading: true,
              title: state.name,
            );
          },
        ),
      ),
      backgroundColor: primaryColor,
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
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
            Expanded(
              child: BlocBuilder<ChapterReadCubit, ChapterReadState>(
                builder: (BuildContext context, ChapterReadState state) {
                  return state.singleVerseDataList.isNotEmpty
                      ? Scrollbar(
                          thickness: 4,
                          radius: const Radius.circular(5),
                          thumbVisibility: true,
                          controller: scrollController,
                          interactive: true,
                          child: ListView.separated(
                            itemCount: state.singleVerseDataList.length,
                            shrinkWrap: true,
                            controller: scrollController,
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 20,
                              right: 20,
                              bottom: 36,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    16.gapSpace(),
                            itemBuilder: (BuildContext context, int index) {
                              SingleVerseModel? singleVerseModel =
                                  state.singleVerseDataList[index];
                              return HtmlWidget(
                                "${singleVerseModel?.verse} ${singleVerseModel?.text ?? ''}",
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: FontFamily.avenirNextRegular,
                                  color: primaryColor,
                                ),
                              );
                              // return HtmlWidget(
                              //   (state.singleVerseData?.content?.isNotEmpty ??
                              //       false)
                              //       ? "${state.singleVerseData?.content}"
                              //       : "",
                              //   textStyle: const TextStyle(
                              //     fontSize: 20,
                              //     fontFamily: FontFamily.avenirNextRegular,
                              //     color: primaryColor,
                              //   ),
                              // );
                            },
                          ),
                        )
                      : Visibility(
                          visible: !EasyLoading.isShow,
                          child: Center(
                            child: Text(
                              LocaleKeys.data_not_found.tr(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: FontFamily.avenirNextRegular,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
