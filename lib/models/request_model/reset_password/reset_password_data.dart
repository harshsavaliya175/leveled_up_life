import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_data.g.dart';

@JsonSerializable()
class ResetPasswordData {
  String email;
  @JsonKey(name: 'verify_code')
  String verifyCode;

  @JsonKey(name: 'new_password')
  String newPassword;

  ResetPasswordData(
    this.email,
    this.verifyCode,
    this.newPassword,
  );

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDataToJson(this);
}
