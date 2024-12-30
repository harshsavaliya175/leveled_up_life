import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_chart_model.freezed.dart';
part 'summary_chart_model.g.dart';

@freezed
class SummaryChartModel with _$SummaryChartModel {
  const factory SummaryChartModel({
    @JsonKey(name: 'days') @Default(0) int days,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'complete') @Default(0) int complete,
    @JsonKey(name: 'incomplete') @Default(0) int incomplete,
    @JsonKey(name: 'remaining') @Default(0) int remaining,
  }) = _SummaryChartModel;

  factory SummaryChartModel.fromJson(Map<String, Object?> json) =>
      _$SummaryChartModelFromJson(json);
}
