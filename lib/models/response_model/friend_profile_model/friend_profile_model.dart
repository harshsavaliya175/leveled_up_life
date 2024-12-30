import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_profile_model.freezed.dart';
part 'friend_profile_model.g.dart';

@freezed
class FriendProfileDetailsModel with _$FriendProfileDetailsModel {
  const factory FriendProfileDetailsModel({
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
    @JsonKey(name: 'friend_id') int? friendId,
    @JsonKey(name: 'sender_token') String? senderToken,
    @JsonKey(name: 'receiver_token') String? receiverToken,
    @JsonKey(name: 'is_accept') int? isAccept,
    @JsonKey(name: 'total_friends') int? totalFriends,
  }) = _FriendProfileDetailsModel;

  factory FriendProfileDetailsModel.fromJson(Map<String, Object?> json) =>
      _$FriendProfileDetailsModelFromJson(json);
}
