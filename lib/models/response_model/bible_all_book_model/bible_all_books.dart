import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_all_books.freezed.dart';
part 'bible_all_books.g.dart';

// @freezed
// class Books with _$Books {
//   const factory Books({
//     @JsonKey(name: 'id') String? id,
//     @JsonKey(name: 'bibleId') String? bibleId,
//     @JsonKey(name: 'abbreviation') String? abbreviation,
//     @JsonKey(name: 'name') String? name,
//     @JsonKey(name: 'nameLong') String? nameLong,
//   }) = _Books;
//
//   factory Books.fromJson(Map<String, Object?> json) => _$BooksFromJson(json);
// }

@freezed
class Books with _$Books {
  const factory Books({
    @JsonKey(name: 'bookid') int? bookId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'chronorder') int? chronorder,
    @JsonKey(name: 'chapters') int? chapters,
  }) = _Books;

  factory Books.fromJson(Map<String, Object?> json) => _$BooksFromJson(json);
}
