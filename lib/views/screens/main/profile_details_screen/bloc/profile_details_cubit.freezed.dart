// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileDetailsState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FriendProfileDetailsModel? get profileModel =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  List<ChallengeModel?> get challengeModelList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileDetailsStateCopyWith<ProfileDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDetailsStateCopyWith<$Res> {
  factory $ProfileDetailsStateCopyWith(
          ProfileDetailsState value, $Res Function(ProfileDetailsState) then) =
      _$ProfileDetailsStateCopyWithImpl<$Res, ProfileDetailsState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      FriendProfileDetailsModel? profileModel,
      int page,
      bool isPaginationLoader,
      List<ChallengeModel?> challengeModelList});

  $FriendProfileDetailsModelCopyWith<$Res>? get profileModel;
}

/// @nodoc
class _$ProfileDetailsStateCopyWithImpl<$Res, $Val extends ProfileDetailsState>
    implements $ProfileDetailsStateCopyWith<$Res> {
  _$ProfileDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? profileModel = freezed,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? challengeModelList = null,
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
      profileModel: freezed == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as FriendProfileDetailsModel?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeModelList: null == challengeModelList
          ? _value.challengeModelList
          : challengeModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FriendProfileDetailsModelCopyWith<$Res>? get profileModel {
    if (_value.profileModel == null) {
      return null;
    }

    return $FriendProfileDetailsModelCopyWith<$Res>(_value.profileModel!,
        (value) {
      return _then(_value.copyWith(profileModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDetailsStateImplCopyWith<$Res>
    implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$$ProfileDetailsStateImplCopyWith(_$ProfileDetailsStateImpl value,
          $Res Function(_$ProfileDetailsStateImpl) then) =
      __$$ProfileDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      FriendProfileDetailsModel? profileModel,
      int page,
      bool isPaginationLoader,
      List<ChallengeModel?> challengeModelList});

  @override
  $FriendProfileDetailsModelCopyWith<$Res>? get profileModel;
}

/// @nodoc
class __$$ProfileDetailsStateImplCopyWithImpl<$Res>
    extends _$ProfileDetailsStateCopyWithImpl<$Res, _$ProfileDetailsStateImpl>
    implements _$$ProfileDetailsStateImplCopyWith<$Res> {
  __$$ProfileDetailsStateImplCopyWithImpl(_$ProfileDetailsStateImpl _value,
      $Res Function(_$ProfileDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? profileModel = freezed,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? challengeModelList = null,
  }) {
    return _then(_$ProfileDetailsStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      profileModel: freezed == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as FriendProfileDetailsModel?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      challengeModelList: null == challengeModelList
          ? _value._challengeModelList
          : challengeModelList // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel?>,
    ));
  }
}

/// @nodoc

class _$ProfileDetailsStateImpl implements _ProfileDetailsState {
  const _$ProfileDetailsStateImpl(
      {this.responseItem,
      this.message = '',
      this.profileModel,
      this.page = 1,
      this.isPaginationLoader = false,
      final List<ChallengeModel?> challengeModelList = const []})
      : _challengeModelList = challengeModelList;

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;
  @override
  final FriendProfileDetailsModel? profileModel;
  @override
  @JsonKey()
  final int page;
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
  String toString() {
    return 'ProfileDetailsState(responseItem: $responseItem, message: $message, profileModel: $profileModel, page: $page, isPaginationLoader: $isPaginationLoader, challengeModelList: $challengeModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDetailsStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            const DeepCollectionEquality()
                .equals(other._challengeModelList, _challengeModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      profileModel,
      page,
      isPaginationLoader,
      const DeepCollectionEquality().hash(_challengeModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDetailsStateImplCopyWith<_$ProfileDetailsStateImpl> get copyWith =>
      __$$ProfileDetailsStateImplCopyWithImpl<_$ProfileDetailsStateImpl>(
          this, _$identity);
}

abstract class _ProfileDetailsState implements ProfileDetailsState {
  const factory _ProfileDetailsState(
          {final ResponseItem? responseItem,
          final String message,
          final FriendProfileDetailsModel? profileModel,
          final int page,
          final bool isPaginationLoader,
          final List<ChallengeModel?> challengeModelList}) =
      _$ProfileDetailsStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  FriendProfileDetailsModel? get profileModel;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  List<ChallengeModel?> get challengeModelList;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDetailsStateImplCopyWith<_$ProfileDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
