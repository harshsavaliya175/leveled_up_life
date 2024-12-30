// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipateModel _$ParticipateModelFromJson(Map<String, dynamic> json) {
  return _ParticipateModel.fromJson(json);
}

/// @nodoc
mixin _$ParticipateModel {
  @JsonKey(name: 'user_token')
  String? get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_photo')
  String? get userProfilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipateModelCopyWith<ParticipateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipateModelCopyWith<$Res> {
  factory $ParticipateModelCopyWith(
          ParticipateModel value, $Res Function(ParticipateModel) then) =
      _$ParticipateModelCopyWithImpl<$Res, ParticipateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class _$ParticipateModelCopyWithImpl<$Res, $Val extends ParticipateModel>
    implements $ParticipateModelCopyWith<$Res> {
  _$ParticipateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToken = freezed,
    Object? userName = freezed,
    Object? userProfilePhoto = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfilePhoto: freezed == userProfilePhoto
          ? _value.userProfilePhoto
          : userProfilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipateModelImplCopyWith<$Res>
    implements $ParticipateModelCopyWith<$Res> {
  factory _$$ParticipateModelImplCopyWith(_$ParticipateModelImpl value,
          $Res Function(_$ParticipateModelImpl) then) =
      __$$ParticipateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class __$$ParticipateModelImplCopyWithImpl<$Res>
    extends _$ParticipateModelCopyWithImpl<$Res, _$ParticipateModelImpl>
    implements _$$ParticipateModelImplCopyWith<$Res> {
  __$$ParticipateModelImplCopyWithImpl(_$ParticipateModelImpl _value,
      $Res Function(_$ParticipateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToken = freezed,
    Object? userName = freezed,
    Object? userProfilePhoto = freezed,
    Object? count = freezed,
  }) {
    return _then(_$ParticipateModelImpl(
      userToken: freezed == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfilePhoto: freezed == userProfilePhoto
          ? _value.userProfilePhoto
          : userProfilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipateModelImpl implements _ParticipateModel {
  const _$ParticipateModelImpl(
      {@JsonKey(name: 'user_token') this.userToken,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_profile_photo') this.userProfilePhoto,
      @JsonKey(name: 'count') this.count});

  factory _$ParticipateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipateModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_token')
  final String? userToken;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_profile_photo')
  final String? userProfilePhoto;
  @override
  @JsonKey(name: 'count')
  final int? count;

  @override
  String toString() {
    return 'ParticipateModel(userToken: $userToken, userName: $userName, userProfilePhoto: $userProfilePhoto, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipateModelImpl &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userProfilePhoto, userProfilePhoto) ||
                other.userProfilePhoto == userProfilePhoto) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userToken, userName, userProfilePhoto, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipateModelImplCopyWith<_$ParticipateModelImpl> get copyWith =>
      __$$ParticipateModelImplCopyWithImpl<_$ParticipateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipateModelImplToJson(
      this,
    );
  }
}

abstract class _ParticipateModel implements ParticipateModel {
  const factory _ParticipateModel(
      {@JsonKey(name: 'user_token') final String? userToken,
      @JsonKey(name: 'user_name') final String? userName,
      @JsonKey(name: 'user_profile_photo') final String? userProfilePhoto,
      @JsonKey(name: 'count') final int? count}) = _$ParticipateModelImpl;

  factory _ParticipateModel.fromJson(Map<String, dynamic> json) =
      _$ParticipateModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_token')
  String? get userToken;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(name: 'user_profile_photo')
  String? get userProfilePhoto;
  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$ParticipateModelImplCopyWith<_$ParticipateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
