import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/bible_book_repo.dart';

part 'chapters_cubit.freezed.dart';
part 'chapters_state.dart';

class ChaptersCubit extends Cubit<ChaptersState> {
  final BibleBookRepo _bibleBookRepo;

  ChaptersCubit(this._bibleBookRepo) : super(const ChaptersState());

  void changeData({
    int? bookId,
    int? chapters,
    String? name,
  }) {
    emit(
      state.copyWith(
        chapters: chapters ?? state.chapters,
        bookId: bookId ?? state.bookId,
        name: name ?? state.name,
      ),
    );
  }

// Future<void> getChapters({required String bookId}) async {
//   EasyLoading.show();
//   emit(state.copyWith(chapterList: []));
//   try {
//     List data = await _bibleBookRepo.bibleSingleBookChapters(
//       bookId: bookId,
//     );
//     List<ChapterModel> chapterList = [];
//     for (var element in data) {
//       chapterList.add(ChapterModel.fromJson(element));
//     }
//     EasyLoading.dismiss();
//     emit(state.copyWith(chapterList: chapterList));
//   } catch (e) {
//     log("$e");
//     emit(state.copyWith(chapterList: []));
//     EasyLoading.dismiss();
//   }
// }
}
