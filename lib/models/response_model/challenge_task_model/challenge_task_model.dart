import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_task_model.freezed.dart';
part 'challenge_task_model.g.dart';

@freezed
class ChallengeTaskModel with _$ChallengeTaskModel {
  const factory ChallengeTaskModel({
    @JsonKey(name: 'challenge_task_id') int? challengeTaskId,
    @JsonKey(name: 'challenge_id') int? challengeId,
    @JsonKey(name: 'challenge_task_name') String? challengeTaskName,
    @JsonKey(name: 'is_complete') int? isComplete,
  }) = _ChallengeTaskModel;

  factory ChallengeTaskModel.fromJson(Map<String, Object?> json) =>
      _$ChallengeTaskModelFromJson(json);
}
