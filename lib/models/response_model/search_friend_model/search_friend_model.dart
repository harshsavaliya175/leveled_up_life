import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_friend_model.freezed.dart';
part 'search_friend_model.g.dart';

@freezed
class SearchFriendModel with _$SearchFriendModel {
  const factory SearchFriendModel({
    @JsonKey(name: 'search_id') int? searchId,
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
    @JsonKey(name: 'friend_id') int? friendId,
    @JsonKey(name: 'sender_token') String? senderToken,
    @JsonKey(name: 'receiver_token') String? receiverToken,
    @JsonKey(name: 'is_accept') int? isAccept,
  }) = _SearchFriendModel;

  factory SearchFriendModel.fromJson(Map<String, Object?> json) =>
      _$SearchFriendModelFromJson(json);
}
