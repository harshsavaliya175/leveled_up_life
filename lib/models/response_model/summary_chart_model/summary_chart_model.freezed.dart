// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_chart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryChartModel _$SummaryChartModelFromJson(Map<String, dynamic> json) {
  return _SummaryChartModel.fromJson(json);
}

/// @nodoc
mixin _$SummaryChartModel {
  @JsonKey(name: 'days')
  int get days => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'complete')
  int get complete => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete')
  int get incomplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining')
  int get remaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryChartModelCopyWith<SummaryChartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryChartModelCopyWith<$Res> {
  factory $SummaryChartModelCopyWith(
          SummaryChartModel value, $Res Function(SummaryChartModel) then) =
      _$SummaryChartModelCopyWithImpl<$Res, SummaryChartModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'days') int days,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'complete') int complete,
      @JsonKey(name: 'incomplete') int incomplete,
      @JsonKey(name: 'remaining') int remaining});
}

/// @nodoc
class _$SummaryChartModelCopyWithImpl<$Res, $Val extends SummaryChartModel>
    implements $SummaryChartModelCopyWith<$Res> {
  _$SummaryChartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? total = null,
    Object? complete = null,
    Object? incomplete = null,
    Object? remaining = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as int,
      incomplete: null == incomplete
          ? _value.incomplete
          : incomplete // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryChartModelImplCopyWith<$Res>
    implements $SummaryChartModelCopyWith<$Res> {
  factory _$$SummaryChartModelImplCopyWith(_$SummaryChartModelImpl value,
          $Res Function(_$SummaryChartModelImpl) then) =
      __$$SummaryChartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'days') int days,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'complete') int complete,
      @JsonKey(name: 'incomplete') int incomplete,
      @JsonKey(name: 'remaining') int remaining});
}

/// @nodoc
class __$$SummaryChartModelImplCopyWithImpl<$Res>
    extends _$SummaryChartModelCopyWithImpl<$Res, _$SummaryChartModelImpl>
    implements _$$SummaryChartModelImplCopyWith<$Res> {
  __$$SummaryChartModelImplCopyWithImpl(_$SummaryChartModelImpl _value,
      $Res Function(_$SummaryChartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? total = null,
    Object? complete = null,
    Object? incomplete = null,
    Object? remaining = null,
  }) {
    return _then(_$SummaryChartModelImpl(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as int,
      incomplete: null == incomplete
          ? _value.incomplete
          : incomplete // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryChartModelImpl implements _SummaryChartModel {
  const _$SummaryChartModelImpl(
      {@JsonKey(name: 'days') this.days = 0,
      @JsonKey(name: 'total') this.total = 0,
      @JsonKey(name: 'complete') this.complete = 0,
      @JsonKey(name: 'incomplete') this.incomplete = 0,
      @JsonKey(name: 'remaining') this.remaining = 0});

  factory _$SummaryChartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryChartModelImplFromJson(json);

  @override
  @JsonKey(name: 'days')
  final int days;
  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'complete')
  final int complete;
  @override
  @JsonKey(name: 'incomplete')
  final int incomplete;
  @override
  @JsonKey(name: 'remaining')
  final int remaining;

  @override
  String toString() {
    return 'SummaryChartModel(days: $days, total: $total, complete: $complete, incomplete: $incomplete, remaining: $remaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryChartModelImpl &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.incomplete, incomplete) ||
                other.incomplete == incomplete) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, days, total, complete, incomplete, remaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryChartModelImplCopyWith<_$SummaryChartModelImpl> get copyWith =>
      __$$SummaryChartModelImplCopyWithImpl<_$SummaryChartModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryChartModelImplToJson(
      this,
    );
  }
}

abstract class _SummaryChartModel implements SummaryChartModel {
  const factory _SummaryChartModel(
          {@JsonKey(name: 'days') final int days,
          @JsonKey(name: 'total') final int total,
          @JsonKey(name: 'complete') final int complete,
          @JsonKey(name: 'incomplete') final int incomplete,
          @JsonKey(name: 'remaining') final int remaining}) =
      _$SummaryChartModelImpl;

  factory _SummaryChartModel.fromJson(Map<String, dynamic> json) =
      _$SummaryChartModelImpl.fromJson;

  @override
  @JsonKey(name: 'days')
  int get days;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'complete')
  int get complete;
  @override
  @JsonKey(name: 'incomplete')
  int get incomplete;
  @override
  @JsonKey(name: 'remaining')
  int get remaining;
  @override
  @JsonKey(ignore: true)
  _$$SummaryChartModelImplCopyWith<_$SummaryChartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
