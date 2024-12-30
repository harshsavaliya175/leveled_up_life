// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_habits_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyHabitsData _$GetMyHabitsDataFromJson(Map<String, dynamic> json) =>
    GetMyHabitsData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$GetMyHabitsDataToJson(GetMyHabitsData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
