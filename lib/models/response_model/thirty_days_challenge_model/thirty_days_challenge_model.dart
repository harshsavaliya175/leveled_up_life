import 'package:freezed_annotation/freezed_annotation.dart';

part 'thirty_days_challenge_model.freezed.dart';
part 'thirty_days_challenge_model.g.dart';

@freezed
class ThirtyDaysChallengeModel with _$ThirtyDaysChallengeModel {
  const factory ThirtyDaysChallengeModel({
    @JsonKey(name: 'days_challenge_id') @Default(0) int daysChallengeId,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'is_complete') @Default(0) int isComplete,
  }) = _ThirtyDaysChallengeModel;

  factory ThirtyDaysChallengeModel.fromJson(Map<String, Object?> json) =>
      _$ThirtyDaysChallengeModelFromJson(json);
}
