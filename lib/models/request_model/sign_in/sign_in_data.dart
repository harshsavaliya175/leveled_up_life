import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_data.g.dart';

@JsonSerializable()
class SignInData {
  String email;
  String password;

  SignInData(
    this.email,
    this.password,
  );

  factory SignInData.fromJson(Map<String, dynamic> json) =>
      _$SignInDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDataToJson(this);
}
