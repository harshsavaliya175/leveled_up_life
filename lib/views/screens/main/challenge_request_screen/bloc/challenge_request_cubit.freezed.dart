// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengeRequestState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  List<ChallengeRequestModel?> get challengeRequestModelList =>
      throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengeRequestStateCopyWith<ChallengeRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeRequestStateCopyWith<$Res> {
  factory $ChallengeRequestStateCopyWith(ChallengeRequestState value,
          $Res Function(ChallengeRequestState) then) =
      _$ChallengeRequestStateCopyWithImpl<$Res, ChallengeRequestState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<ChallengeRequestModel?> challengeRequestModelList,
      bool isForceLogout});
}

/// @nodoc
class _$ChallengeRequestStateCopyWithImpl<$Res,
        $Val extends ChallengeRequestState>
    implements $ChallengeRequestStateCopyWith<$Res> {
  _$ChallengeRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? challengeRequestModelList = null,
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
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeRequestModelList: null == challengeRequestModelList
          ? _value.challengeRequestModelList
          : challengeRequestModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeRequestModel?>,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeRequestStateImplCopyWith<$Res>
    implements $ChallengeRequestStateCopyWith<$Res> {
  factory _$$ChallengeRequestStateImplCopyWith(
          _$ChallengeRequestStateImpl value,
          $Res Function(_$ChallengeRequestStateImpl) then) =
      __$$ChallengeRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<ChallengeRequestModel?> challengeRequestModelList,
      bool isForceLogout});
}

/// @nodoc
class __$$ChallengeRequestStateImplCopyWithImpl<$Res>
    extends _$ChallengeRequestStateCopyWithImpl<$Res,
        _$ChallengeRequestStateImpl>
    implements _$$ChallengeRequestStateImplCopyWith<$Res> {
  __$$ChallengeRequestStateImplCopyWithImpl(_$ChallengeRequestStateImpl _value,
      $Res Function(_$ChallengeRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? challengeRequestModelList = null,
    Object? isForceLogout = null,
  }) {
    return _then(_$ChallengeRequestStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeRequestModelList: null == challengeRequestModelList
          ? _value._challengeRequestModelList
          : challengeRequestModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeRequestModel?>,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChallengeRequestStateImpl implements _ChallengeRequestState {
  const _$ChallengeRequestStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.isPaginationLoader = false,
      final List<ChallengeRequestModel?> challengeRequestModelList = const [],
      this.isForceLogout = false})
      : _challengeRequestModelList = challengeRequestModelList;

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isPaginationLoader;
  final List<ChallengeRequestModel?> _challengeRequestModelList;
  @override
  @JsonKey()
  List<ChallengeRequestModel?> get challengeRequestModelList {
    if (_challengeRequestModelList is EqualUnmodifiableListView)
      return _challengeRequestModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengeRequestModelList);
  }

  @override
  @JsonKey()
  final bool isForceLogout;

  @override
  String toString() {
    return 'ChallengeRequestState(responseItem: $responseItem, message: $message, page: $page, isPaginationLoader: $isPaginationLoader, challengeRequestModelList: $challengeRequestModelList, isForceLogout: $isForceLogout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeRequestStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            const DeepCollectionEquality().equals(
                other._challengeRequestModelList, _challengeRequestModelList) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      isPaginationLoader,
      const DeepCollectionEquality().hash(_challengeRequestModelList),
      isForceLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeRequestStateImplCopyWith<_$ChallengeRequestStateImpl>
      get copyWith => __$$ChallengeRequestStateImplCopyWithImpl<
          _$ChallengeRequestStateImpl>(this, _$identity);
}

abstract class _ChallengeRequestState implements ChallengeRequestState {
  const factory _ChallengeRequestState(
      {final ResponseItem? responseItem,
      final String message,
      final int page,
      final bool isPaginationLoader,
      final List<ChallengeRequestModel?> challengeRequestModelList,
      final bool isForceLogout}) = _$ChallengeRequestStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  List<ChallengeRequestModel?> get challengeRequestModelList;
  @override
  bool get isForceLogout;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeRequestStateImplCopyWith<_$ChallengeRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
