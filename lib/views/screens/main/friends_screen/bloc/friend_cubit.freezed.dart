// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FriendState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  List<FriendModel?> get friendModelList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendStateCopyWith<FriendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendStateCopyWith<$Res> {
  factory $FriendStateCopyWith(
          FriendState value, $Res Function(FriendState) then) =
      _$FriendStateCopyWithImpl<$Res, FriendState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<FriendModel?> friendModelList});
}

/// @nodoc
class _$FriendStateCopyWithImpl<$Res, $Val extends FriendState>
    implements $FriendStateCopyWith<$Res> {
  _$FriendStateCopyWithImpl(this._value, this._then);

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
    Object? friendModelList = null,
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
      friendModelList: null == friendModelList
          ? _value.friendModelList
          : friendModelList // ignore: cast_nullable_to_non_nullable
              as List<FriendModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendStateImplCopyWith<$Res>
    implements $FriendStateCopyWith<$Res> {
  factory _$$FriendStateImplCopyWith(
          _$FriendStateImpl value, $Res Function(_$FriendStateImpl) then) =
      __$$FriendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<FriendModel?> friendModelList});
}

/// @nodoc
class __$$FriendStateImplCopyWithImpl<$Res>
    extends _$FriendStateCopyWithImpl<$Res, _$FriendStateImpl>
    implements _$$FriendStateImplCopyWith<$Res> {
  __$$FriendStateImplCopyWithImpl(
      _$FriendStateImpl _value, $Res Function(_$FriendStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? friendModelList = null,
  }) {
    return _then(_$FriendStateImpl(
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
      friendModelList: null == friendModelList
          ? _value._friendModelList
          : friendModelList // ignore: cast_nullable_to_non_nullable
              as List<FriendModel?>,
    ));
  }
}

/// @nodoc

class _$FriendStateImpl implements _FriendState {
  const _$FriendStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.isPaginationLoader = false,
      final List<FriendModel?> friendModelList = const []})
      : _friendModelList = friendModelList;

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
  final List<FriendModel?> _friendModelList;
  @override
  @JsonKey()
  List<FriendModel?> get friendModelList {
    if (_friendModelList is EqualUnmodifiableListView) return _friendModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendModelList);
  }

  @override
  String toString() {
    return 'FriendState(responseItem: $responseItem, message: $message, page: $page, isPaginationLoader: $isPaginationLoader, friendModelList: $friendModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            const DeepCollectionEquality()
                .equals(other._friendModelList, _friendModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      isPaginationLoader,
      const DeepCollectionEquality().hash(_friendModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendStateImplCopyWith<_$FriendStateImpl> get copyWith =>
      __$$FriendStateImplCopyWithImpl<_$FriendStateImpl>(this, _$identity);
}

abstract class _FriendState implements FriendState {
  const factory _FriendState(
      {final ResponseItem? responseItem,
      final String message,
      final int page,
      final bool isPaginationLoader,
      final List<FriendModel?> friendModelList}) = _$FriendStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  List<FriendModel?> get friendModelList;
  @override
  @JsonKey(ignore: true)
  _$$FriendStateImplCopyWith<_$FriendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
