// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AffirmationModel _$AffirmationModelFromJson(Map<String, dynamic> json) {
  return _AffirmationModel.fromJson(json);
}

/// @nodoc
mixin _$AffirmationModel {
  @JsonKey(name: 'affirmation_id')
  int get affirmationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'affirmation_date')
  String get affirmationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'affirmation_title')
  String get affirmationTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AffirmationModelCopyWith<AffirmationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationModelCopyWith<$Res> {
  factory $AffirmationModelCopyWith(
          AffirmationModel value, $Res Function(AffirmationModel) then) =
      _$AffirmationModelCopyWithImpl<$Res, AffirmationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'affirmation_id') int affirmationId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'affirmation_date') String affirmationDate,
      @JsonKey(name: 'affirmation_title') String affirmationTitle});
}

/// @nodoc
class _$AffirmationModelCopyWithImpl<$Res, $Val extends AffirmationModel>
    implements $AffirmationModelCopyWith<$Res> {
  _$AffirmationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmationId = null,
    Object? userToken = null,
    Object? affirmationDate = null,
    Object? affirmationTitle = null,
  }) {
    return _then(_value.copyWith(
      affirmationId: null == affirmationId
          ? _value.affirmationId
          : affirmationId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationDate: null == affirmationDate
          ? _value.affirmationDate
          : affirmationDate // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationTitle: null == affirmationTitle
          ? _value.affirmationTitle
          : affirmationTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffirmationModelImplCopyWith<$Res>
    implements $AffirmationModelCopyWith<$Res> {
  factory _$$AffirmationModelImplCopyWith(_$AffirmationModelImpl value,
          $Res Function(_$AffirmationModelImpl) then) =
      __$$AffirmationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'affirmation_id') int affirmationId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'affirmation_date') String affirmationDate,
      @JsonKey(name: 'affirmation_title') String affirmationTitle});
}

/// @nodoc
class __$$AffirmationModelImplCopyWithImpl<$Res>
    extends _$AffirmationModelCopyWithImpl<$Res, _$AffirmationModelImpl>
    implements _$$AffirmationModelImplCopyWith<$Res> {
  __$$AffirmationModelImplCopyWithImpl(_$AffirmationModelImpl _value,
      $Res Function(_$AffirmationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmationId = null,
    Object? userToken = null,
    Object? affirmationDate = null,
    Object? affirmationTitle = null,
  }) {
    return _then(_$AffirmationModelImpl(
      affirmationId: null == affirmationId
          ? _value.affirmationId
          : affirmationId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationDate: null == affirmationDate
          ? _value.affirmationDate
          : affirmationDate // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationTitle: null == affirmationTitle
          ? _value.affirmationTitle
          : affirmationTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AffirmationModelImpl implements _AffirmationModel {
  const _$AffirmationModelImpl(
      {@JsonKey(name: 'affirmation_id') this.affirmationId = 0,
      @JsonKey(name: 'user_token') this.userToken = '',
      @JsonKey(name: 'affirmation_date') this.affirmationDate = '',
      @JsonKey(name: 'affirmation_title') this.affirmationTitle = ''});

  factory _$AffirmationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AffirmationModelImplFromJson(json);

  @override
  @JsonKey(name: 'affirmation_id')
  final int affirmationId;
  @override
  @JsonKey(name: 'user_token')
  final String userToken;
  @override
  @JsonKey(name: 'affirmation_date')
  final String affirmationDate;
  @override
  @JsonKey(name: 'affirmation_title')
  final String affirmationTitle;

  @override
  String toString() {
    return 'AffirmationModel(affirmationId: $affirmationId, userToken: $userToken, affirmationDate: $affirmationDate, affirmationTitle: $affirmationTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffirmationModelImpl &&
            (identical(other.affirmationId, affirmationId) ||
                other.affirmationId == affirmationId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.affirmationDate, affirmationDate) ||
                other.affirmationDate == affirmationDate) &&
            (identical(other.affirmationTitle, affirmationTitle) ||
                other.affirmationTitle == affirmationTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, affirmationId, userToken, affirmationDate, affirmationTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffirmationModelImplCopyWith<_$AffirmationModelImpl> get copyWith =>
      __$$AffirmationModelImplCopyWithImpl<_$AffirmationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AffirmationModelImplToJson(
      this,
    );
  }
}

abstract class _AffirmationModel implements AffirmationModel {
  const factory _AffirmationModel(
          {@JsonKey(name: 'affirmation_id') final int affirmationId,
          @JsonKey(name: 'user_token') final String userToken,
          @JsonKey(name: 'affirmation_date') final String affirmationDate,
          @JsonKey(name: 'affirmation_title') final String affirmationTitle}) =
      _$AffirmationModelImpl;

  factory _AffirmationModel.fromJson(Map<String, dynamic> json) =
      _$AffirmationModelImpl.fromJson;

  @override
  @JsonKey(name: 'affirmation_id')
  int get affirmationId;
  @override
  @JsonKey(name: 'user_token')
  String get userToken;
  @override
  @JsonKey(name: 'affirmation_date')
  String get affirmationDate;
  @override
  @JsonKey(name: 'affirmation_title')
  String get affirmationTitle;
  @override
  @JsonKey(ignore: true)
  _$$AffirmationModelImplCopyWith<_$AffirmationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
