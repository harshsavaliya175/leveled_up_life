import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_affirmation_list_data.g.dart';

@JsonSerializable()
class GetAffirmationListData {
  int page;
  int limit;

  @JsonKey(name: 'affirmation_date')
  String affirmationDate;

  GetAffirmationListData(
    this.page,
    this.limit,
    this.affirmationDate,
  );

  factory GetAffirmationListData.fromJson(Map<String, dynamic> json) =>
      _$GetAffirmationListDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAffirmationListDataToJson(this);
}
