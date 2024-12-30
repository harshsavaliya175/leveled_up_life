// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_affirmation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAffirmationData _$AddAffirmationDataFromJson(Map<String, dynamic> json) =>
    AddAffirmationData(
      json['affirmation_date'] as String,
      json['affirmation_title'] as String,
    );

Map<String, dynamic> _$AddAffirmationDataToJson(AddAffirmationData instance) =>
    <String, dynamic>{
      'affirmation_date': instance.affirmationDate,
      'affirmation_title': instance.affirmationTitle,
    };
