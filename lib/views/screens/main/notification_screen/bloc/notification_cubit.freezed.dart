// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  List<NotificationModel?> get notificationModelList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<NotificationModel?> notificationModelList});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

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
    Object? notificationModelList = null,
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
      notificationModelList: null == notificationModelList
          ? _value.notificationModelList
          : notificationModelList // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      List<NotificationModel?> notificationModelList});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? notificationModelList = null,
  }) {
    return _then(_$NotificationStateImpl(
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
      notificationModelList: null == notificationModelList
          ? _value._notificationModelList
          : notificationModelList // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel?>,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl implements _NotificationState {
  const _$NotificationStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.isPaginationLoader = false,
      final List<NotificationModel?> notificationModelList = const []})
      : _notificationModelList = notificationModelList;

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
  final List<NotificationModel?> _notificationModelList;
  @override
  @JsonKey()
  List<NotificationModel?> get notificationModelList {
    if (_notificationModelList is EqualUnmodifiableListView)
      return _notificationModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationModelList);
  }

  @override
  String toString() {
    return 'NotificationState(responseItem: $responseItem, message: $message, page: $page, isPaginationLoader: $isPaginationLoader, notificationModelList: $notificationModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            const DeepCollectionEquality()
                .equals(other._notificationModelList, _notificationModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      isPaginationLoader,
      const DeepCollectionEquality().hash(_notificationModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
          {final ResponseItem? responseItem,
          final String message,
          final int page,
          final bool isPaginationLoader,
          final List<NotificationModel?> notificationModelList}) =
      _$NotificationStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  List<NotificationModel?> get notificationModelList;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
