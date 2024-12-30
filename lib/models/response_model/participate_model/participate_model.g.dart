// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipateModelImpl _$$ParticipateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipateModelImpl(
      userToken: json['user_token'] as String?,
      userName: json['user_name'] as String?,
      userProfilePhoto: json['user_profile_photo'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ParticipateModelImplToJson(
        _$ParticipateModelImpl instance) =>
    <String, dynamic>{
      'user_token': instance.userToken,
      'user_name': instance.userName,
      'user_profile_photo': instance.userProfilePhoto,
      'count': instance.count,
    };
