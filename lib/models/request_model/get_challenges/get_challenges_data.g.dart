// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_challenges_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChallengesData _$GetChallengesDataFromJson(Map<String, dynamic> json) =>
    GetChallengesData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      json['user_token'] as String,
    );

Map<String, dynamic> _$GetChallengesDataToJson(GetChallengesData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'user_token': instance.userToken,
    };
