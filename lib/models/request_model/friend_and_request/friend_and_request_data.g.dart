// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_and_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendAndRequestData _$FriendAndRequestDataFromJson(
        Map<String, dynamic> json) =>
    FriendAndRequestData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      json['type'] as String,
    );

Map<String, dynamic> _$FriendAndRequestDataToJson(
        FriendAndRequestData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'type': instance.type,
    };
