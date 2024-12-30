import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_and_request_data.g.dart';

@JsonSerializable()
class FriendAndRequestData {
  int page;
  int limit;
  String type;

  FriendAndRequestData(
    this.page,
    this.limit,
    this.type,
  );

  factory FriendAndRequestData.fromJson(Map<String, dynamic> json) =>
      _$FriendAndRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$FriendAndRequestDataToJson(this);
}
