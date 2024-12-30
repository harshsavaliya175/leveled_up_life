import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_data.g.dart';

@JsonSerializable()
class ForgotPasswordData {
  String email;

  ForgotPasswordData(this.email);

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordDataToJson(this);
}
