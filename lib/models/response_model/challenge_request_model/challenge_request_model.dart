import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/models/response_model/challenge_task_model/challenge_task_model.dart';

part 'challenge_request_model.freezed.dart';
part 'challenge_request_model.g.dart';

@freezed
class ChallengeRequestModel with _$ChallengeRequestModel {
  const factory ChallengeRequestModel({
    @JsonKey(name: 'challenge_friend_id') @Default(0) int challengeFriendId,
    @JsonKey(name: 'challenge_name') @Default('') String challengeName,
    @JsonKey(name: 'total_day') @Default(0) int totalDay,
    @JsonKey(name: 'challenge_task_list')
    List<ChallengeTaskModel>? challengeTaskList,
  }) = _ChallengeRequestModel;

  factory ChallengeRequestModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeRequestModelFromJson(json);
}
