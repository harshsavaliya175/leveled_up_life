import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/config/routes/route_manager.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/views/screens/main/chapter_read_screen/bloc/chapter_read_cubit.dart';
import 'package:leveled_up_life/views/screens/main/chapter_screen/bloc/chapters_cubit.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class ChapterScreen extends StatelessWidget {
  // final String title;

  const ChapterScreen({
    super.key,
    // required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocBuilder<ChaptersCubit, ChaptersState>(
          builder: (BuildContext context, ChaptersState state) {
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: BlocBuilder<ChaptersCubit, ChaptersState>(
                    builder: (BuildContext context, ChaptersState state) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 20,
                          right: 20,
                          bottom: 32,
                        ),
                        itemCount: state.chapters,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            12.gapSpace(),
                        itemBuilder: (BuildContext context, int index) {
                          return Material(
                            color: tileColor,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                // context
                                //     .read<ChapterReadCubit>()
                                //     .getSingleBookVerse(
                                //       chapterId:
                                //           "${state.chapterList[index].id}",
                                //     );
                                context
                                    .read<ChapterReadCubit>()
                                    .getSingleBookVerse(
                                      bookId: state.bookId,
                                      chapterId: index + 1,
                                      name: "${state.name} ${index + 1}",
                                    );
                                context.pushNamed(
                                  AppRoutes.chapterRead,
                                  // extra:
                                  //     "${state.chapterList[index].reference}",
                                );
                              },
                              child: Container(
                                height: 52,
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Text(
                                        "${state.name} ${index + 1}",
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
                      );
                      // return state.chapterList.isNotEmpty
                      //     ? ListView.separated(
                      //         padding: const EdgeInsets.only(
                      //           top: 12,
                      //           left: 20,
                      //           right: 20,
                      //           bottom: 32,
                      //         ),
                      //         itemCount: state.chapters,
                      //         shrinkWrap: true,
                      //         separatorBuilder:
                      //             (BuildContext context, int index) =>
                      //                 12.gapSpace(),
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return Material(
                      //             color: tileColor,
                      //             borderRadius: BorderRadius.circular(12),
                      //             child: InkWell(
                      //               borderRadius: BorderRadius.circular(12),
                      //               onTap: () {
                      //                 context
                      //                     .read<ChapterReadCubit>()
                      //                     .getSingleBookVerse(
                      //                       chapterId:
                      //                           "${state.chapterList[index].id}",
                      //                     );
                      //                 context.pushNamed(
                      //                   AppRoutes.chapterRead,
                      //                   extra:
                      //                       "${state.chapterList[index].reference}",
                      //                 );
                      //               },
                      //               child: Container(
                      //                 height: 52,
                      //                 width: size.width,
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 16),
                      //                 alignment: Alignment.center,
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Expanded(
                      //                       flex: 9,
                      //                       child: Text(
                      //                         "${state.name} $index",
                      //                         style: const TextStyle(
                      //                           fontSize: 16,
                      //                           color: primaryColor,
                      //                           fontFamily:
                      //                               FontFamily.avenirNextMedium,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       flex: 1,
                      //                       child: Align(
                      //                         alignment: Alignment.centerRight,
                      //                         child: Assets.icons.icNext
                      //                             .svg(fit: BoxFit.scaleDown),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       )
                      //     : Visibility(
                      //         visible: !EasyLoading.isShow,
                      //         child: Center(
                      //           child: Text(
                      //             LocaleKeys.chapters_not_found.tr(),
                      //             style: const TextStyle(
                      //               fontSize: 16,
                      //               color: primaryColor,
                      //               fontFamily: FontFamily.avenirNextMedium,
                      //             ),
                      //           ),
                      //         ),
                      //       );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
