// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_all_books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BooksImpl _$$BooksImplFromJson(Map<String, dynamic> json) => _$BooksImpl(
      bookId: (json['bookid'] as num?)?.toInt(),
      name: json['name'] as String?,
      chronorder: (json['chronorder'] as num?)?.toInt(),
      chapters: (json['chapters'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BooksImplToJson(_$BooksImpl instance) =>
    <String, dynamic>{
      'bookid': instance.bookId,
      'name': instance.name,
      'chronorder': instance.chronorder,
      'chapters': instance.chapters,
    };
