part of 'chapter_read_cubit.dart';

@freezed
class ChapterReadState with _$ChapterReadState {
  const factory ChapterReadState({
    @Default([]) List<SingleVerseModel?> singleVerseDataList,
    @Default(0) int chapterId,
    @Default(0) int bookId,
    @Default('') String name,
  }) = _ChapterReadState;
}
