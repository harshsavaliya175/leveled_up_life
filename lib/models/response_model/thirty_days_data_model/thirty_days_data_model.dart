import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/models/response_model/thirty_days_challenge_model/thirty_days_challenge_model.dart';

part 'thirty_days_data_model.freezed.dart';
part 'thirty_days_data_model.g.dart';

@freezed
class ThirtyDaysDataModel with _$ThirtyDaysDataModel {
  const factory ThirtyDaysDataModel({
    @JsonKey(name: 'days') @Default(1) int days,
    @JsonKey(name: 'challenge_list')
    @Default([])
    List<ThirtyDaysChallengeModel?> challengeList,
  }) = _ThirtyDaysDataModel;

  factory ThirtyDaysDataModel.fromJson(Map<String, Object?> json) =>
      _$ThirtyDaysDataModelFromJson(json);
}
