// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendModelImpl _$$FriendModelImplFromJson(Map<String, dynamic> json) =>
    _$FriendModelImpl(
      friendId: (json['friend_id'] as num?)?.toInt(),
      userToken: json['user_token'] as String?,
      userName: json['user_name'] as String?,
      userProfilePhoto: json['user_profile_photo'] as String?,
      isSelect: json['is_select'] as bool? ?? false,
    );

Map<String, dynamic> _$$FriendModelImplToJson(_$FriendModelImpl instance) =>
    <String, dynamic>{
      'friend_id': instance.friendId,
      'user_token': instance.userToken,
      'user_name': instance.userName,
      'user_profile_photo': instance.userProfilePhoto,
      'is_select': instance.isSelect,
    };
