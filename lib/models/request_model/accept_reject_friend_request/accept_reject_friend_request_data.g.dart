// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_reject_friend_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRejectFriendRequestData _$AcceptRejectFriendRequestDataFromJson(
        Map<String, dynamic> json) =>
    AcceptRejectFriendRequestData(
      json['type'] as String,
      json['opp_user_token'] as String,
    );

Map<String, dynamic> _$AcceptRejectFriendRequestDataToJson(
        AcceptRejectFriendRequestData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'opp_user_token': instance.oppUserToken,
    };
