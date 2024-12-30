import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_data.g.dart';

@JsonSerializable()
class SignUpData {
  @JsonKey(name: 'user_name')
  String name;
  String email;
  String password;

  SignUpData(
    this.name,
    this.email,
    this.password,
  );

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpDataToJson(this);
}
