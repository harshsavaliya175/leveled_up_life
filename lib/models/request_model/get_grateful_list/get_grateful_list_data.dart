import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_grateful_list_data.g.dart';

@JsonSerializable()
class GetGratefulListData {
  int page;
  int limit;

  @JsonKey(name: 'grateful_date')
  String gratefulDate;

  GetGratefulListData(
    this.page,
    this.limit,
    this.gratefulDate,
  );

  factory GetGratefulListData.fromJson(Map<String, dynamic> json) =>
      _$GetGratefulListDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetGratefulListDataToJson(this);
}
