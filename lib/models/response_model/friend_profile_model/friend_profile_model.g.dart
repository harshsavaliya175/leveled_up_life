// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendProfileDetailsModelImpl _$$FriendProfileDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendProfileDetailsModelImpl(
      userToken: json['user_token'] as String?,
      userName: json['user_name'] as String?,
      userProfilePhoto: json['user_profile_photo'] as String?,
      friendId: (json['friend_id'] as num?)?.toInt(),
      senderToken: json['sender_token'] as String?,
      receiverToken: json['receiver_token'] as String?,
      isAccept: (json['is_accept'] as num?)?.toInt(),
      totalFriends: (json['total_friends'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FriendProfileDetailsModelImplToJson(
        _$FriendProfileDetailsModelImpl instance) =>
    <String, dynamic>{
      'user_token': instance.userToken,
      'user_name': instance.userName,
      'user_profile_photo': instance.userProfilePhoto,
      'friend_id': instance.friendId,
      'sender_token': instance.senderToken,
      'receiver_token': instance.receiverToken,
      'is_accept': instance.isAccept,
      'total_friends': instance.totalFriends,
    };
