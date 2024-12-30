// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookChapterModelImpl _$$BookChapterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookChapterModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookChapterModelImplToJson(
        _$BookChapterModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ChapterModelImpl _$$ChapterModelImplFromJson(Map<String, dynamic> json) =>
    _$ChapterModelImpl(
      id: json['id'] as String?,
      bibleId: json['bibleId'] as String?,
      bookId: json['bookId'] as String?,
      number: json['number'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$$ChapterModelImplToJson(_$ChapterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bibleId': instance.bibleId,
      'bookId': instance.bookId,
      'number': instance.number,
      'reference': instance.reference,
    };
