import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_challenge_data.g.dart';

@JsonSerializable()
class CreateChallengeData {
  @JsonKey(name: 'challenge_name')
  String challengeName;
  @JsonKey(name: 'task_name')
  List taskName;
  @JsonKey(name: 'challenge_startdate')
  String challengeStartDate;
  @JsonKey(name: 'challenge_enddate')
  String challengeEndDate;
  @JsonKey(name: 'is_set_reminder')
  int isSetReminder;
  @JsonKey(name: 'user_tokens')
  List userTokens;

  CreateChallengeData({
    required this.challengeName,
    required this.taskName,
    required this.challengeStartDate,
    required this.challengeEndDate,
    required this.isSetReminder,
    required this.userTokens,
  });

  factory CreateChallengeData.fromJson(Map<String, dynamic> json) =>
      _$CreateChallengeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChallengeDataToJson(this);
}
