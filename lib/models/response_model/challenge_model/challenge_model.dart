import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/models/response_model/challenge_task_model/challenge_task_model.dart';
import 'package:leveled_up_life/models/response_model/participate_model/participate_model.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    @JsonKey(name: 'challenge_id') int? challengeId,
    @JsonKey(name: 'user_token') String? userToken,
    @JsonKey(name: 'challenge_name') String? challengeName,
    @JsonKey(name: 'task_name') String? taskName,
    @JsonKey(name: 'challenge_startdate') String? challengeStartDate,
    @JsonKey(name: 'challenge_enddate') String? challengeEndDate,
    @JsonKey(name: 'total_day') int? totalDay,
    @JsonKey(name: 'is_set_reminder') int? isSetReminder,
    @JsonKey(name: 'is_challenge_complete') int? isChallengeComplete,
    @JsonKey(name: 'current_day') int? currentDay,
    @JsonKey(name: 'is_today_challenge_complete') int? isTodayChallengeComplete,
    @JsonKey(name: 'days_count') int? dayCount,
    @JsonKey(name: 'participate_list') List<ParticipateModel>? participateList,
    @JsonKey(name: 'challenge_task_list')
    List<ChallengeTaskModel>? challengeTaskList,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeModelFromJson(json);
}
