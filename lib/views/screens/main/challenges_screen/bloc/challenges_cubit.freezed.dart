// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengesState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get getChallengeRequestCount => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  List<ChallengeModel?> get challengeModelList =>
      throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChallengesStateCopyWith<ChallengesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengesStateCopyWith<$Res> {
  factory $ChallengesStateCopyWith(
          ChallengesState value, $Res Function(ChallengesState) then) =
      _$ChallengesStateCopyWithImpl<$Res, ChallengesState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      int getChallengeRequestCount,
      bool isPaginationLoader,
      List<ChallengeModel?> challengeModelList,
      bool isForceLogout});
}

/// @nodoc
class _$ChallengesStateCopyWithImpl<$Res, $Val extends ChallengesState>
    implements $ChallengesStateCopyWith<$Res> {
  _$ChallengesStateCopyWithImpl(this._value, this._then);

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
    Object? getChallengeRequestCount = null,
    Object? isPaginationLoader = null,
    Object? challengeModelList = null,
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
      getChallengeRequestCount: null == getChallengeRequestCount
          ? _value.getChallengeRequestCount
          : getChallengeRequestCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeModelList: null == challengeModelList
          ? _value.challengeModelList
          : challengeModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel?>,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengesStateImplCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory _$$ChallengesStateImplCopyWith(_$ChallengesStateImpl value,
          $Res Function(_$ChallengesStateImpl) then) =
      __$$ChallengesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      int getChallengeRequestCount,
      bool isPaginationLoader,
      List<ChallengeModel?> challengeModelList,
      bool isForceLogout});
}

/// @nodoc
class __$$ChallengesStateImplCopyWithImpl<$Res>
    extends _$ChallengesStateCopyWithImpl<$Res, _$ChallengesStateImpl>
    implements _$$ChallengesStateImplCopyWith<$Res> {
  __$$ChallengesStateImplCopyWithImpl(
      _$ChallengesStateImpl _value, $Res Function(_$ChallengesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? getChallengeRequestCount = null,
    Object? isPaginationLoader = null,
    Object? challengeModelList = null,
    Object? isForceLogout = null,
  }) {
    return _then(_$ChallengesStateImpl(
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
      getChallengeRequestCount: null == getChallengeRequestCount
          ? _value.getChallengeRequestCount
          : getChallengeRequestCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeModelList: null == challengeModelList
          ? _value._challengeModelList
          : challengeModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel?>,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChallengesStateImpl implements _ChallengesState {
  const _$ChallengesStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.getChallengeRequestCount = 0,
      this.isPaginationLoader = false,
      final List<ChallengeModel?> challengeModelList = const [],
      this.isForceLogout = false})
      : _challengeModelList = challengeModelList;

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
  final int getChallengeRequestCount;
  @override
  @JsonKey()
  final bool isPaginationLoader;
  final List<ChallengeModel?> _challengeModelList;
  @override
  @JsonKey()
  List<ChallengeModel?> get challengeModelList {
    if (_challengeModelList is EqualUnmodifiableListView)
      return _challengeModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengeModelList);
  }

  @override
  @JsonKey()
  final bool isForceLogout;

  @override
  String toString() {
    return 'ChallengesState(responseItem: $responseItem, message: $message, page: $page, getChallengeRequestCount: $getChallengeRequestCount, isPaginationLoader: $isPaginationLoader, challengeModelList: $challengeModelList, isForceLogout: $isForceLogout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengesStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(
                    other.getChallengeRequestCount, getChallengeRequestCount) ||
                other.getChallengeRequestCount == getChallengeRequestCount) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            const DeepCollectionEquality()
                .equals(other._challengeModelList, _challengeModelList) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      getChallengeRequestCount,
      isPaginationLoader,
      const DeepCollectionEquality().hash(_challengeModelList),
      isForceLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengesStateImplCopyWith<_$ChallengesStateImpl> get copyWith =>
      __$$ChallengesStateImplCopyWithImpl<_$ChallengesStateImpl>(
          this, _$identity);
}

abstract class _ChallengesState implements ChallengesState {
  const factory _ChallengesState(
      {final ResponseItem? responseItem,
      final String message,
      final int page,
      final int getChallengeRequestCount,
      final bool isPaginationLoader,
      final List<ChallengeModel?> challengeModelList,
      final bool isForceLogout}) = _$ChallengesStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  int get getChallengeRequestCount;
  @override
  bool get isPaginationLoader;
  @override
  List<ChallengeModel?> get challengeModelList;
  @override
  bool get isForceLogout;
  @override
  @JsonKey(ignore: true)
  _$$ChallengesStateImplCopyWith<_$ChallengesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
