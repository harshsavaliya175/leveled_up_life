// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_verse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BibleVerseModelImpl _$$BibleVerseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BibleVerseModelImpl(
      day: (json['day'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$BibleVerseModelImplToJson(
        _$BibleVerseModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'title': instance.title,
    };
