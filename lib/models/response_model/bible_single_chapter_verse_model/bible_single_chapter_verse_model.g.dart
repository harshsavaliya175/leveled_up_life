// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_single_chapter_verse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleVerseModelImpl _$$SingleVerseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleVerseModelImpl(
      pk: (json['pk'] as num?)?.toInt(),
      verse: (json['verse'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$SingleVerseModelImplToJson(
        _$SingleVerseModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'verse': instance.verse,
      'text': instance.text,
    };
