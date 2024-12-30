// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AffirmationModelImpl _$$AffirmationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AffirmationModelImpl(
      affirmationId: (json['affirmation_id'] as num?)?.toInt() ?? 0,
      userToken: json['user_token'] as String? ?? '',
      affirmationDate: json['affirmation_date'] as String? ?? '',
      affirmationTitle: json['affirmation_title'] as String? ?? '',
    );

Map<String, dynamic> _$$AffirmationModelImplToJson(
        _$AffirmationModelImpl instance) =>
    <String, dynamic>{
      'affirmation_id': instance.affirmationId,
      'user_token': instance.userToken,
      'affirmation_date': instance.affirmationDate,
      'affirmation_title': instance.affirmationTitle,
    };
