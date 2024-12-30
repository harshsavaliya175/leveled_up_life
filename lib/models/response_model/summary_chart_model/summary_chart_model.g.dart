// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryChartModelImpl _$$SummaryChartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryChartModelImpl(
      days: (json['days'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      complete: (json['complete'] as num?)?.toInt() ?? 0,
      incomplete: (json['incomplete'] as num?)?.toInt() ?? 0,
      remaining: (json['remaining'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SummaryChartModelImplToJson(
        _$SummaryChartModelImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'total': instance.total,
      'complete': instance.complete,
      'incomplete': instance.incomplete,
      'remaining': instance.remaining,
    };
