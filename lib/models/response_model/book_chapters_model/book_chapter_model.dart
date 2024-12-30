import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_chapter_model.freezed.dart';
part 'book_chapter_model.g.dart';

@freezed
class BookChapterModel with _$BookChapterModel {
  const factory BookChapterModel({
    @JsonKey(name: 'data') List<ChapterModel>? data,
  }) = _BookChapterModel;

  factory BookChapterModel.fromJson(Map<String, Object?> json) => _$BookChapterModelFromJson(json);
}

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'bibleId') String? bibleId,
    @JsonKey(name: 'bookId') String? bookId,
    @JsonKey(name: 'number') String? number,
    @JsonKey(name: 'reference') String? reference,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, Object?> json) => _$ChapterModelFromJson(json);
}

