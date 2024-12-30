import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_my_habits_data.g.dart';

@JsonSerializable()
class GetMyHabitsData {
  int page;
  int limit;

  GetMyHabitsData(
    this.page,
    this.limit,
  );

  factory GetMyHabitsData.fromJson(Map<String, dynamic> json) =>
      _$GetMyHabitsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyHabitsDataToJson(this);
}
