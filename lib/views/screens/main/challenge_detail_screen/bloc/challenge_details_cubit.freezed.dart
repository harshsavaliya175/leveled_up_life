// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengeDetailsState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ChallengeModel? get challengeModel => throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengeDetailsStateCopyWith<ChallengeDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeDetailsStateCopyWith<$Res> {
  factory $ChallengeDetailsStateCopyWith(ChallengeDetailsState value,
          $Res Function(ChallengeDetailsState) then) =
      _$ChallengeDetailsStateCopyWithImpl<$Res, ChallengeDetailsState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      ChallengeModel? challengeModel,
      bool isForceLogout});

  $ChallengeModelCopyWith<$Res>? get challengeModel;
}

/// @nodoc
class _$ChallengeDetailsStateCopyWithImpl<$Res,
        $Val extends ChallengeDetailsState>
    implements $ChallengeDetailsStateCopyWith<$Res> {
  _$ChallengeDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? challengeModel = freezed,
    Object? isForceLogout = null,
  }) {
    return _then(_value.copyWith(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      challengeModel: freezed == challengeModel
          ? _value.challengeModel
          : challengeModel // ignore: cast_nullable_to_non_nullable
              as ChallengeModel?,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChallengeModelCopyWith<$Res>? get challengeModel {
    if (_value.challengeModel == null) {
      return null;
    }

    return $ChallengeModelCopyWith<$Res>(_value.challengeModel!, (value) {
      return _then(_value.copyWith(challengeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengeDetailsStateImplCopyWith<$Res>
    implements $ChallengeDetailsStateCopyWith<$Res> {
  factory _$$ChallengeDetailsStateImplCopyWith(
          _$ChallengeDetailsStateImpl value,
          $Res Function(_$ChallengeDetailsStateImpl) then) =
      __$$ChallengeDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      ChallengeModel? challengeModel,
      bool isForceLogout});

  @override
  $ChallengeModelCopyWith<$Res>? get challengeModel;
}

/// @nodoc
class __$$ChallengeDetailsStateImplCopyWithImpl<$Res>
    extends _$ChallengeDetailsStateCopyWithImpl<$Res,
        _$ChallengeDetailsStateImpl>
    implements _$$ChallengeDetailsStateImplCopyWith<$Res> {
  __$$ChallengeDetailsStateImplCopyWithImpl(_$ChallengeDetailsStateImpl _value,
      $Res Function(_$ChallengeDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? challengeModel = freezed,
    Object? isForceLogout = null,
  }) {
    return _then(_$ChallengeDetailsStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      challengeModel: freezed == challengeModel
          ? _value.challengeModel
          : challengeModel // ignore: cast_nullable_to_non_nullable
              as ChallengeModel?,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChallengeDetailsStateImpl implements _ChallengeDetailsState {
  const _$ChallengeDetailsStateImpl(
      {this.responseItem,
      this.message = '',
      this.challengeModel,
      this.isForceLogout = false});

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;
  @override
  final ChallengeModel? challengeModel;
  @override
  @JsonKey()
  final bool isForceLogout;

  @override
  String toString() {
    return 'ChallengeDetailsState(responseItem: $responseItem, message: $message, challengeModel: $challengeModel, isForceLogout: $isForceLogout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeDetailsStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.challengeModel, challengeModel) ||
                other.challengeModel == challengeModel) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, responseItem, message, challengeModel, isForceLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeDetailsStateImplCopyWith<_$ChallengeDetailsStateImpl>
      get copyWith => __$$ChallengeDetailsStateImplCopyWithImpl<
          _$ChallengeDetailsStateImpl>(this, _$identity);
}

abstract class _ChallengeDetailsState implements ChallengeDetailsState {
  const factory _ChallengeDetailsState(
      {final ResponseItem? responseItem,
      final String message,
      final ChallengeModel? challengeModel,
      final bool isForceLogout}) = _$ChallengeDetailsStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  ChallengeModel? get challengeModel;
  @override
  bool get isForceLogout;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeDetailsStateImplCopyWith<_$ChallengeDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
