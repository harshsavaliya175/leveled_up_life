// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordData _$ChangePasswordDataFromJson(Map<String, dynamic> json) =>
    ChangePasswordData(
      json['old_password'] as String,
      json['new_password'] as String,
    );

Map<String, dynamic> _$ChangePasswordDataToJson(ChangePasswordData instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
    };
