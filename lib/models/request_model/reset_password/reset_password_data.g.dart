// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordData _$ResetPasswordDataFromJson(Map<String, dynamic> json) =>
    ResetPasswordData(
      json['email'] as String,
      json['verify_code'] as String,
      json['new_password'] as String,
    );

Map<String, dynamic> _$ResetPasswordDataToJson(ResetPasswordData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verify_code': instance.verifyCode,
      'new_password': instance.newPassword,
    };
