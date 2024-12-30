import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_affirmation_data.g.dart';

@JsonSerializable()
class AddAffirmationData {
  @JsonKey(name: 'affirmation_date')
  String affirmationDate;
  @JsonKey(name: 'affirmation_title')
  String affirmationTitle;

  AddAffirmationData(
    this.affirmationDate,
    this.affirmationTitle,
  );

  factory AddAffirmationData.fromJson(Map<String, dynamic> json) =>
      _$AddAffirmationDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddAffirmationDataToJson(this);
}
