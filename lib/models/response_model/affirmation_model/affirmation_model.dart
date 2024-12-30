import 'package:freezed_annotation/freezed_annotation.dart';

part 'affirmation_model.freezed.dart';
part 'affirmation_model.g.dart';

@freezed
class AffirmationModel with _$AffirmationModel {
  const factory AffirmationModel({
    @JsonKey(name: 'affirmation_id') @Default(0) int affirmationId,
    @JsonKey(name: 'user_token') @Default('') String userToken,
    @JsonKey(name: 'affirmation_date') @Default('') String affirmationDate,
    @JsonKey(name: 'affirmation_title') @Default('') String affirmationTitle,
  }) = _AffirmationModel;

  factory AffirmationModel.fromJson(Map<String, Object?> json) =>
      _$AffirmationModelFromJson(json);
}
