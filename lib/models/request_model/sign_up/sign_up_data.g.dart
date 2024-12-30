// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) => SignUpData(
      json['user_name'] as String,
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SignUpDataToJson(SignUpData instance) =>
    <String, dynamic>{
      'user_name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
