// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchFriendModelImpl _$$SearchFriendModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchFriendModelImpl(
      searchId: (json['search_id'] as num?)?.toInt(),
      userToken: json['user_token'] as String?,
      userName: json['user_name'] as String?,
      userProfilePhoto: json['user_profile_photo'] as String?,
      friendId: (json['friend_id'] as num?)?.toInt(),
      senderToken: json['sender_token'] as String?,
      receiverToken: json['receiver_token'] as String?,
      isAccept: (json['is_accept'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SearchFriendModelImplToJson(
        _$SearchFriendModelImpl instance) =>
    <String, dynamic>{
      'search_id': instance.searchId,
      'user_token': instance.userToken,
      'user_name': instance.userName,
      'user_profile_photo': instance.userProfilePhoto,
      'friend_id': instance.friendId,
      'sender_token': instance.senderToken,
      'receiver_token': instance.receiverToken,
      'is_accept': instance.isAccept,
    };
