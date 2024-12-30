part of 'bible_screen_cubit.dart';

@freezed
class BibleScreenState with _$BibleScreenState {
  const factory BibleScreenState({
    @Default([]) List<Books> bibleBooks,
  }) = _BibleScreenState;
}
