import 'package:freezed_annotation/freezed_annotation.dart';

part 'participate_model.freezed.dart';
part 'participate_model.g.dart';

@freezed
class ParticipateModel with _$ParticipateModel {
  const factory ParticipateModel({
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
    @JsonKey(name: 'count') int? count,
  }) = _ParticipateModel;

  factory ParticipateModel.fromJson(Map<String, Object?> json) =>
      _$ParticipateModelFromJson(json);
}
