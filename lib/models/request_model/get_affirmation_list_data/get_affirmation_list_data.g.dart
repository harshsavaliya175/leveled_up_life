// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_affirmation_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAffirmationListData _$GetAffirmationListDataFromJson(
        Map<String, dynamic> json) =>
    GetAffirmationListData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      json['affirmation_date'] as String,
    );

Map<String, dynamic> _$GetAffirmationListDataToJson(
        GetAffirmationListData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'affirmation_date': instance.affirmationDate,
    };
