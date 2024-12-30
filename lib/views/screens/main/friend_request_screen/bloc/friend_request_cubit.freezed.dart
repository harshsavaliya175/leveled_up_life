// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendRequestState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;
  List<FriendModel?> get friendRequestModelList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendRequestStateCopyWith<FriendRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestStateCopyWith<$Res> {
  factory $FriendRequestStateCopyWith(
          FriendRequestState value, $Res Function(FriendRequestState) then) =
      _$FriendRequestStateCopyWithImpl<$Res, FriendRequestState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      bool isForceLogout,
      List<FriendModel?> friendRequestModelList});
}

/// @nodoc
class _$FriendRequestStateCopyWithImpl<$Res, $Val extends FriendRequestState>
    implements $FriendRequestStateCopyWith<$Res> {
  _$FriendRequestStateCopyWithImpl(this._value, this._then);

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
    Object? isForceLogout = null,
    Object? friendRequestModelList = null,
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
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      friendRequestModelList: null == friendRequestModelList
          ? _value.friendRequestModelList
          : friendRequestModelList // ignore: cast_nullable_to_non_nullable
              as List<FriendModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendRequestStateImplCopyWith<$Res>
    implements $FriendRequestStateCopyWith<$Res> {
  factory _$$FriendRequestStateImplCopyWith(_$FriendRequestStateImpl value,
          $Res Function(_$FriendRequestStateImpl) then) =
      __$$FriendRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      bool isForceLogout,
      List<FriendModel?> friendRequestModelList});
}

/// @nodoc
class __$$FriendRequestStateImplCopyWithImpl<$Res>
    extends _$FriendRequestStateCopyWithImpl<$Res, _$FriendRequestStateImpl>
    implements _$$FriendRequestStateImplCopyWith<$Res> {
  __$$FriendRequestStateImplCopyWithImpl(_$FriendRequestStateImpl _value,
      $Res Function(_$FriendRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? isForceLogout = null,
    Object? friendRequestModelList = null,
  }) {
    return _then(_$FriendRequestStateImpl(
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
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
      friendRequestModelList: null == friendRequestModelList
          ? _value._friendRequestModelList
          : friendRequestModelList // ignore: cast_nullable_to_non_nullable
              as List<FriendModel?>,
    ));
  }
}

/// @nodoc

class _$FriendRequestStateImpl implements _FriendRequestState {
  const _$FriendRequestStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.isPaginationLoader = false,
      this.isForceLogout = false,
      final List<FriendModel?> friendRequestModelList = const []})
      : _friendRequestModelList = friendRequestModelList;

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
  @override
  @JsonKey()
  final bool isForceLogout;
  final List<FriendModel?> _friendRequestModelList;
  @override
  @JsonKey()
  List<FriendModel?> get friendRequestModelList {
    if (_friendRequestModelList is EqualUnmodifiableListView)
      return _friendRequestModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendRequestModelList);
  }

  @override
  String toString() {
    return 'FriendRequestState(responseItem: $responseItem, message: $message, page: $page, isPaginationLoader: $isPaginationLoader, isForceLogout: $isForceLogout, friendRequestModelList: $friendRequestModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendRequestStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout) &&
            const DeepCollectionEquality().equals(
                other._friendRequestModelList, _friendRequestModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      isPaginationLoader,
      isForceLogout,
      const DeepCollectionEquality().hash(_friendRequestModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestStateImplCopyWith<_$FriendRequestStateImpl> get copyWith =>
      __$$FriendRequestStateImplCopyWithImpl<_$FriendRequestStateImpl>(
          this, _$identity);
}

abstract class _FriendRequestState implements FriendRequestState {
  const factory _FriendRequestState(
          {final ResponseItem? responseItem,
          final String message,
          final int page,
          final bool isPaginationLoader,
          final bool isForceLogout,
          final List<FriendModel?> friendRequestModelList}) =
      _$FriendRequestStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  bool get isForceLogout;
  @override
  List<FriendModel?> get friendRequestModelList;
  @override
  @JsonKey(ignore: true)
  _$$FriendRequestStateImplCopyWith<_$FriendRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
