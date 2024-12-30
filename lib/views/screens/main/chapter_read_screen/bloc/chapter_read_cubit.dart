import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/bible_book_repo.dart';

import '../../../../../models/response_model/bible_single_chapter_verse_model/bible_single_chapter_verse_model.dart';

part 'chapter_read_cubit.freezed.dart';
part 'chapter_read_state.dart';

class ChapterReadCubit extends Cubit<ChapterReadState> {
  final BibleBookRepo _bibleBookRepo;

  ChapterReadCubit(this._bibleBookRepo) : super(const ChapterReadState());

  void changeData({
    int? bookId,
    int? chapterId,
  }) {
    emit(
      state.copyWith(
        chapterId: chapterId ?? state.chapterId,
        bookId: bookId ?? state.bookId,
      ),
    );
  }

  Future<void> getSingleBookVerse({
    required int chapterId,
    required int bookId,
    required String name,
  }) async {
    emit(state.copyWith(
      singleVerseDataList: [],
      chapterId: chapterId,
      bookId: bookId,
      name: name,
    ));
    EasyLoading.show();
    try {
      List data = await _bibleBookRepo.singleChaptersDetail(
        chapterId: state.chapterId,
        bookId: state.bookId,
      );

      List<SingleVerseModel> singleVerseData = [];
      for (var element in data) {
        singleVerseData.add(SingleVerseModel.fromJson(element));
      }
      emit(state.copyWith(singleVerseDataList: singleVerseData));
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      emit(state.copyWith(singleVerseDataList: []));
      EasyLoading.dismiss();
    }
  }

// Future<void> getSingleBookVerse({required String chapterId}) async {
//   emit(state.copyWith(singleVerseData: null));
//   EasyLoading.show();
//   try {
//     Map<String, dynamic> data =
//         await _bibleBookRepo.singleChaptersDetail(chapterId: chapterId);
//     SingleVerseModel singleVerseData = SingleVerseModel.fromJson(data);
//
//     EasyLoading.dismiss();
//     emit(state.copyWith(singleVerseData: singleVerseData));
//   } catch (e) {
//     log('$e');
//     emit(state.copyWith(singleVerseData: null));
//     EasyLoading.dismiss();
//   }
// }
}
