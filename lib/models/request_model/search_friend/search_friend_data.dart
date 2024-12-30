import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_friend_data.g.dart';

@JsonSerializable()
class SearchFriendData {
  int page;
  int limit;
  @JsonKey(name: 'search_txt')
  String searchText;

  SearchFriendData(
    this.page,
    this.limit,
    this.searchText,
  );

  factory SearchFriendData.fromJson(Map<String, dynamic> json) =>
      _$SearchFriendDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFriendDataToJson(this);
}
