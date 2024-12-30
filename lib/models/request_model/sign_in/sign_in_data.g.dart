// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInData _$SignInDataFromJson(Map<String, dynamic> json) => SignInData(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SignInDataToJson(SignInData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
