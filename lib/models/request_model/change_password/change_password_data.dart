import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_data.g.dart';

@JsonSerializable()
class ChangePasswordData {
  @JsonKey(name: 'old_password')
  String oldPassword;
  @JsonKey(name: 'new_password')
  String newPassword;

  ChangePasswordData(
    this.oldPassword,
    this.newPassword,
  );

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordDataToJson(this);
}
