// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thirty_days_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThirtyDaysDataModel _$ThirtyDaysDataModelFromJson(Map<String, dynamic> json) {
  return _ThirtyDaysDataModel.fromJson(json);
}

/// @nodoc
mixin _$ThirtyDaysDataModel {
  @JsonKey(name: 'days')
  int get days => throw _privateConstructorUsedError;
  @JsonKey(name: 'challenge_list')
  List<ThirtyDaysChallengeModel?> get challengeList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThirtyDaysDataModelCopyWith<ThirtyDaysDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThirtyDaysDataModelCopyWith<$Res> {
  factory $ThirtyDaysDataModelCopyWith(
          ThirtyDaysDataModel value, $Res Function(ThirtyDaysDataModel) then) =
      _$ThirtyDaysDataModelCopyWithImpl<$Res, ThirtyDaysDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'days') int days,
      @JsonKey(name: 'challenge_list')
      List<ThirtyDaysChallengeModel?> challengeList});
}

/// @nodoc
class _$ThirtyDaysDataModelCopyWithImpl<$Res, $Val extends ThirtyDaysDataModel>
    implements $ThirtyDaysDataModelCopyWith<$Res> {
  _$ThirtyDaysDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? challengeList = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      challengeList: null == challengeList
          ? _value.challengeList
          : challengeList // ignore: cast_nullable_to_non_nullable
              as List<ThirtyDaysChallengeModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThirtyDaysDataModelImplCopyWith<$Res>
    implements $ThirtyDaysDataModelCopyWith<$Res> {
  factory _$$ThirtyDaysDataModelImplCopyWith(_$ThirtyDaysDataModelImpl value,
          $Res Function(_$ThirtyDaysDataModelImpl) then) =
      __$$ThirtyDaysDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'days') int days,
      @JsonKey(name: 'challenge_list')
      List<ThirtyDaysChallengeModel?> challengeList});
}

/// @nodoc
class __$$ThirtyDaysDataModelImplCopyWithImpl<$Res>
    extends _$ThirtyDaysDataModelCopyWithImpl<$Res, _$ThirtyDaysDataModelImpl>
    implements _$$ThirtyDaysDataModelImplCopyWith<$Res> {
  __$$ThirtyDaysDataModelImplCopyWithImpl(_$ThirtyDaysDataModelImpl _value,
      $Res Function(_$ThirtyDaysDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? challengeList = null,
  }) {
    return _then(_$ThirtyDaysDataModelImpl(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      challengeList: null == challengeList
          ? _value._challengeList
          : challengeList // ignore: cast_nullable_to_non_nullable
              as List<ThirtyDaysChallengeModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThirtyDaysDataModelImpl implements _ThirtyDaysDataModel {
  const _$ThirtyDaysDataModelImpl(
      {@JsonKey(name: 'days') this.days = 1,
      @JsonKey(name: 'challenge_list')
      final List<ThirtyDaysChallengeModel?> challengeList = const []})
      : _challengeList = challengeList;

  factory _$ThirtyDaysDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThirtyDaysDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'days')
  final int days;
  final List<ThirtyDaysChallengeModel?> _challengeList;
  @override
  @JsonKey(name: 'challenge_list')
  List<ThirtyDaysChallengeModel?> get challengeList {
    if (_challengeList is EqualUnmodifiableListView) return _challengeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengeList);
  }

  @override
  String toString() {
    return 'ThirtyDaysDataModel(days: $days, challengeList: $challengeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThirtyDaysDataModelImpl &&
            (identical(other.days, days) || other.days == days) &&
            const DeepCollectionEquality()
                .equals(other._challengeList, _challengeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, days, const DeepCollectionEquality().hash(_challengeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThirtyDaysDataModelImplCopyWith<_$ThirtyDaysDataModelImpl> get copyWith =>
      __$$ThirtyDaysDataModelImplCopyWithImpl<_$ThirtyDaysDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThirtyDaysDataModelImplToJson(
      this,
    );
  }
}

abstract class _ThirtyDaysDataModel implements ThirtyDaysDataModel {
  const factory _ThirtyDaysDataModel(
          {@JsonKey(name: 'days') final int days,
          @JsonKey(name: 'challenge_list')
          final List<ThirtyDaysChallengeModel?> challengeList}) =
      _$ThirtyDaysDataModelImpl;

  factory _ThirtyDaysDataModel.fromJson(Map<String, dynamic> json) =
      _$ThirtyDaysDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'days')
  int get days;
  @override
  @JsonKey(name: 'challenge_list')
  List<ThirtyDaysChallengeModel?> get challengeList;
  @override
  @JsonKey(ignore: true)
  _$$ThirtyDaysDataModelImplCopyWith<_$ThirtyDaysDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
