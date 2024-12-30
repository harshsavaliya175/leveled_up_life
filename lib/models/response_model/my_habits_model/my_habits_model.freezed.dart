// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_habits_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyHabitsModel _$MyHabitsModelFromJson(Map<String, dynamic> json) {
  return _MyHabitsModel.fromJson(json);
}

/// @nodoc
mixin _$MyHabitsModel {
  @JsonKey(name: 'habit_id')
  int? get habitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String? get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'habit_name')
  String? get habitName => throw _privateConstructorUsedError;
  @JsonKey(name: 'habit_time')
  String? get habitTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_set_reminder')
  int? get isSetReminder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyHabitsModelCopyWith<MyHabitsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyHabitsModelCopyWith<$Res> {
  factory $MyHabitsModelCopyWith(
          MyHabitsModel value, $Res Function(MyHabitsModel) then) =
      _$MyHabitsModelCopyWithImpl<$Res, MyHabitsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'habit_id') int? habitId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'habit_name') String? habitName,
      @JsonKey(name: 'habit_time') String? habitTime,
      @JsonKey(name: 'is_set_reminder') int? isSetReminder});
}

/// @nodoc
class _$MyHabitsModelCopyWithImpl<$Res, $Val extends MyHabitsModel>
    implements $MyHabitsModelCopyWith<$Res> {
  _$MyHabitsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? userToken = freezed,
    Object? habitName = freezed,
    Object? habitTime = freezed,
    Object? isSetReminder = freezed,
  }) {
    return _then(_value.copyWith(
      habitId: freezed == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int?,
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      habitName: freezed == habitName
          ? _value.habitName
          : habitName // ignore: cast_nullable_to_non_nullable
              as String?,
      habitTime: freezed == habitTime
          ? _value.habitTime
          : habitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isSetReminder: freezed == isSetReminder
          ? _value.isSetReminder
          : isSetReminder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyHabitsModelImplCopyWith<$Res>
    implements $MyHabitsModelCopyWith<$Res> {
  factory _$$MyHabitsModelImplCopyWith(
          _$MyHabitsModelImpl value, $Res Function(_$MyHabitsModelImpl) then) =
      __$$MyHabitsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'habit_id') int? habitId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'habit_name') String? habitName,
      @JsonKey(name: 'habit_time') String? habitTime,
      @JsonKey(name: 'is_set_reminder') int? isSetReminder});
}

/// @nodoc
class __$$MyHabitsModelImplCopyWithImpl<$Res>
    extends _$MyHabitsModelCopyWithImpl<$Res, _$MyHabitsModelImpl>
    implements _$$MyHabitsModelImplCopyWith<$Res> {
  __$$MyHabitsModelImplCopyWithImpl(
      _$MyHabitsModelImpl _value, $Res Function(_$MyHabitsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitId = freezed,
    Object? userToken = freezed,
    Object? habitName = freezed,
    Object? habitTime = freezed,
    Object? isSetReminder = freezed,
  }) {
    return _then(_$MyHabitsModelImpl(
      habitId: freezed == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as int?,
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      habitName: freezed == habitName
          ? _value.habitName
          : habitName // ignore: cast_nullable_to_non_nullable
              as String?,
      habitTime: freezed == habitTime
          ? _value.habitTime
          : habitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isSetReminder: freezed == isSetReminder
          ? _value.isSetReminder
          : isSetReminder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyHabitsModelImpl implements _MyHabitsModel {
  const _$MyHabitsModelImpl(
      {@JsonKey(name: 'habit_id') this.habitId,
      @JsonKey(name: 'user_token') this.userToken,
      @JsonKey(name: 'habit_name') this.habitName,
      @JsonKey(name: 'habit_time') this.habitTime,
      @JsonKey(name: 'is_set_reminder') this.isSetReminder});

  factory _$MyHabitsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyHabitsModelImplFromJson(json);

  @override
  @JsonKey(name: 'habit_id')
  final int? habitId;
  @override
  @JsonKey(name: 'user_token')
  final String? userToken;
  @override
  @JsonKey(name: 'habit_name')
  final String? habitName;
  @override
  @JsonKey(name: 'habit_time')
  final String? habitTime;
  @override
  @JsonKey(name: 'is_set_reminder')
  final int? isSetReminder;

  @override
  String toString() {
    return 'MyHabitsModel(habitId: $habitId, userToken: $userToken, habitName: $habitName, habitTime: $habitTime, isSetReminder: $isSetReminder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyHabitsModelImpl &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.habitName, habitName) ||
                other.habitName == habitName) &&
            (identical(other.habitTime, habitTime) ||
                other.habitTime == habitTime) &&
            (identical(other.isSetReminder, isSetReminder) ||
                other.isSetReminder == isSetReminder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, habitId, userToken, habitName, habitTime, isSetReminder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyHabitsModelImplCopyWith<_$MyHabitsModelImpl> get copyWith =>
      __$$MyHabitsModelImplCopyWithImpl<_$MyHabitsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyHabitsModelImplToJson(
      this,
    );
  }
}

abstract class _MyHabitsModel implements MyHabitsModel {
  const factory _MyHabitsModel(
          {@JsonKey(name: 'habit_id') final int? habitId,
          @JsonKey(name: 'user_token') final String? userToken,
          @JsonKey(name: 'habit_name') final String? habitName,
          @JsonKey(name: 'habit_time') final String? habitTime,
          @JsonKey(name: 'is_set_reminder') final int? isSetReminder}) =
      _$MyHabitsModelImpl;

  factory _MyHabitsModel.fromJson(Map<String, dynamic> json) =
      _$MyHabitsModelImpl.fromJson;

  @override
  @JsonKey(name: 'habit_id')
  int? get habitId;
  @override
  @JsonKey(name: 'user_token')
  String? get userToken;
  @override
  @JsonKey(name: 'habit_name')
  String? get habitName;
  @override
  @JsonKey(name: 'habit_time')
  String? get habitTime;
  @override
  @JsonKey(name: 'is_set_reminder')
  int? get isSetReminder;
  @override
  @JsonKey(ignore: true)
  _$$MyHabitsModelImplCopyWith<_$MyHabitsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
