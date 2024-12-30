import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_reject_friend_request_data.g.dart';

@JsonSerializable()
class AcceptRejectFriendRequestData {
  String type;

  @JsonKey(name: 'opp_user_token')
  String oppUserToken;

  AcceptRejectFriendRequestData(
    this.type,
    this.oppUserToken,
  );

  factory AcceptRejectFriendRequestData.fromJson(Map<String, dynamic> json) =>
      _$AcceptRejectFriendRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptRejectFriendRequestDataToJson(this);
}
