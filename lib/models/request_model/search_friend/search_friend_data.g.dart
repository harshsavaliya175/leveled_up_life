// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_friend_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFriendData _$SearchFriendDataFromJson(Map<String, dynamic> json) =>
    SearchFriendData(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      json['search_txt'] as String,
    );

Map<String, dynamic> _$SearchFriendDataToJson(SearchFriendData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'search_txt': instance.searchText,
    };
