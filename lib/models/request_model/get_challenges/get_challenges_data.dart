import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_challenges_data.g.dart';

@JsonSerializable()
class GetChallengesData {
  int page;
  int limit;

  @JsonKey(name: 'user_token')
  String userToken;

  GetChallengesData(
    this.page,
    this.limit,
    this.userToken,
  );

  factory GetChallengesData.fromJson(Map<String, dynamic> json) =>
      _$GetChallengesDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetChallengesDataToJson(this);
}
