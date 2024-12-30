import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendModel with _$FriendModel {
  const factory FriendModel({
    @JsonKey(name: 'friend_id') int? friendId,
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
    @JsonKey(name: 'is_select') @Default(false) bool isSelect,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, Object?> json) =>
      _$FriendModelFromJson(json);
}
