import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_verse_model.freezed.dart';
part 'bible_verse_model.g.dart';

@freezed
class BibleVerseModel with _$BibleVerseModel {
  const factory BibleVerseModel({
    @JsonKey(name: 'day') @Default(0) int day,
    @JsonKey(name: 'title') @Default('') String title,
  }) = _BibleVerseModel;

  factory BibleVerseModel.fromJson(Map<String, Object?> json) =>
      _$BibleVerseModelFromJson(json);
}
