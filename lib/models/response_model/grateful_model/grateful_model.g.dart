// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grateful_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GratefulModelImpl _$$GratefulModelImplFromJson(Map<String, dynamic> json) =>
    _$GratefulModelImpl(
      gratefulId: (json['grateful_id'] as num?)?.toInt() ?? 0,
      userToken: json['user_token'] as String? ?? '',
      gratefulDate: json['grateful_date'] as String? ?? '',
      gratefulTitle: json['grateful_title'] as String? ?? '',
      gratefulImg: json['grateful_img'] as String? ?? '',
    );

Map<String, dynamic> _$$GratefulModelImplToJson(_$GratefulModelImpl instance) =>
    <String, dynamic>{
      'grateful_id': instance.gratefulId,
      'user_token': instance.userToken,
      'grateful_date': instance.gratefulDate,
      'grateful_title': instance.gratefulTitle,
      'grateful_img': instance.gratefulImg,
    };
