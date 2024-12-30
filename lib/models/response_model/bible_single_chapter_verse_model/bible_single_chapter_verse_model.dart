import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_single_chapter_verse_model.freezed.dart';
part 'bible_single_chapter_verse_model.g.dart';
//
// @freezed
// class BibleSingleChapterVerseModel with _$BibleSingleChapterVerseModel {
//   const factory BibleSingleChapterVerseModel({
//     @JsonKey(name: 'data') SingleVerseModel? data,
//     @JsonKey(name: 'meta') MetaFunctionDataModel? meta,
//   }) = _BibleSingleChapterVerseModel;
//
//   factory BibleSingleChapterVerseModel.fromJson(Map<String, Object?> json) =>
//       _$BibleSingleChapterVerseModelFromJson(json);
// }
//
// @freezed
// class MetaFunctionDataModel with _$MetaFunctionDataModel {
//   const factory MetaFunctionDataModel({
//     @JsonKey(name: 'fums') String? fums,
//     @JsonKey(name: 'fumsId') String? fumsId,
//     @JsonKey(name: 'fumsJsInclude') String? fumsJsInclude,
//     @JsonKey(name: 'fumsJs') String? fumsJs,
//     @JsonKey(name: 'fumsNoScript') String? fumsNoScript,
//   }) = _MetaFunctionDataModel;
//
//   factory MetaFunctionDataModel.fromJson(Map<String, Object?> json) =>
//       _$MetaFunctionDataModelFromJson(json);
// }
//
// @freezed
// class SingleVerseModel with _$SingleVerseModel {
//   const factory SingleVerseModel({
//     @JsonKey(name: 'id') String? id,
//     @JsonKey(name: 'bibleId') String? bibleId,
//     @JsonKey(name: 'number') String? number,
//     @JsonKey(name: 'bookId') String? bookId,
//     @JsonKey(name: 'content') String? content,
//     @JsonKey(name: 'reference') String? reference,
//     @JsonKey(name: 'verseCount') int? verseCount,
//     @JsonKey(name: 'next') NextVerseModel? next,
//     @JsonKey(name: 'previous') PreviousVerseModel? previous,
//     @JsonKey(name: 'copyright') String? copyright,
//   }) = _SingleVerseModel;
//
//   factory SingleVerseModel.fromJson(Map<String, Object?> json) =>
//       _$SingleVerseModelFromJson(json);
// }
//
// @freezed
// class PreviousVerseModel with _$PreviousVerseModel {
//   const factory PreviousVerseModel({
//     @JsonKey(name: 'id') String? id,
//     @JsonKey(name: 'bookId') String? bookId,
//     @JsonKey(name: 'number') String? number,
//   }) = _PreviousVerseModel;
//
//   factory PreviousVerseModel.fromJson(Map<String, Object?> json) =>
//       _$PreviousVerseModelFromJson(json);
// }
//
// @freezed
// class NextVerseModel with _$NextVerseModel {
//   const factory NextVerseModel({
//     @JsonKey(name: 'id') String? id,
//     @JsonKey(name: 'bookId') String? bookId,
//     @JsonKey(name: 'number') String? number,
//   }) = _NextVerseModel;
//
//   factory NextVerseModel.fromJson(Map<String, Object?> json) =>
//       _$NextVerseModelFromJson(json);
// }

@freezed
class SingleVerseModel with _$SingleVerseModel {
  const factory SingleVerseModel(
      {@JsonKey(name: 'pk') int? pk,
      @JsonKey(name: 'verse') int? verse,
      @JsonKey(name: 'text') String? text}) = _SingleVerseModel;

  factory SingleVerseModel.fromJson(Map<String, Object?> json) =>
      _$SingleVerseModelFromJson(json);
}
