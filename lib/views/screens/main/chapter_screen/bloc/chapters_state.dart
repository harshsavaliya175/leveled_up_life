part of 'chapters_cubit.dart';

@freezed
class ChaptersState with _$ChaptersState {
  const factory ChaptersState({
    // @Default([]) List<ChapterModel> chapterList,
    @Default('') String name,
    @Default(0) int chapters,
    @Default(0) int bookId,
  }) = _ChaptersState;
}
