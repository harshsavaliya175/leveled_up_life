import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/bible_screen/bloc/bible_screen_cubit.dart';
import 'package:leveled_up_life/views/screens/main/chapter_screen/bloc/chapters_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: true,
          title: LocaleKeys.the_holy_bible.tr(),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
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
                child: BlocBuilder<BibleScreenCubit, BibleScreenState>(
                  builder: (BuildContext context, BibleScreenState state) {
                    return state.bibleBooks.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 20,
                              right: 20,
                              bottom: 32,
                            ),
                            itemCount: state.bibleBooks.length,
                            shrinkWrap: true,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    12.gapSpace(),
                            itemBuilder: (BuildContext context, int index) {
                              return Material(
                                color: tileColor,
                                borderRadius: BorderRadius.circular(12),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    // context.read<ChaptersCubit>().getChapters(
                                    //     bookId: state.bibleBooks[index].id
                                    //         .toString()
                                    //         .toLowerCase());
                                    context.read<ChaptersCubit>().changeData(
                                          name: state.bibleBooks[index].name,
                                          chapters:
                                              state.bibleBooks[index].chapters,
                                          bookId:
                                              state.bibleBooks[index].bookId,
                                        );
                                    context.pushNamed(AppRoutes.chapters);
                                  },
                                  child: Container(
                                    height: 52,
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            "${state.bibleBooks[index].name}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: primaryColor,
                                              fontFamily:
                                                  FontFamily.avenirNextMedium,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Assets.icons.icNext
                                                .svg(fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Visibility(
                            visible: !EasyLoading.isShow,
                            child: Center(
                              child: Text(
                                LocaleKeys.book_not_found.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: FontFamily.avenirNextMedium,
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
      ),
    );
  }
}
