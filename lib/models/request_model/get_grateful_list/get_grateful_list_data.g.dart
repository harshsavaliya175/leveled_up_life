// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_grateful_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGratefulListData _$GetGratefulListDataFromJson(Map<String, dynamic> json) =>
    GetGratefulListData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      json['grateful_date'] as String,
    );

Map<String, dynamic> _$GetGratefulListDataToJson(
        GetGratefulListData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'grateful_date': instance.gratefulDate,
    };
