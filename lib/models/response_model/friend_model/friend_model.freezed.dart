// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendModel _$FriendModelFromJson(Map<String, dynamic> json) {
  return _FriendModel.fromJson(json);
}

/// @nodoc
mixin _$FriendModel {
  @JsonKey(name: 'friend_id')
  int? get friendId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String? get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_photo')
  String? get userProfilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_select')
  bool get isSelect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendModelCopyWith<FriendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendModelCopyWith<$Res> {
  factory $FriendModelCopyWith(
          FriendModel value, $Res Function(FriendModel) then) =
      _$FriendModelCopyWithImpl<$Res, FriendModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'friend_id') int? friendId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'is_select') bool isSelect});
}

/// @nodoc
class _$FriendModelCopyWithImpl<$Res, $Val extends FriendModel>
    implements $FriendModelCopyWith<$Res> {
  _$FriendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendId = freezed,
    Object? userToken = freezed,
    Object? userName = freezed,
    Object? userProfilePhoto = freezed,
    Object? isSelect = null,
  }) {
    return _then(_value.copyWith(
      friendId: freezed == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendModelImplCopyWith<$Res>
    implements $FriendModelCopyWith<$Res> {
  factory _$$FriendModelImplCopyWith(
          _$FriendModelImpl value, $Res Function(_$FriendModelImpl) then) =
      __$$FriendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'friend_id') int? friendId,
      @JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'is_select') bool isSelect});
}

/// @nodoc
class __$$FriendModelImplCopyWithImpl<$Res>
    extends _$FriendModelCopyWithImpl<$Res, _$FriendModelImpl>
    implements _$$FriendModelImplCopyWith<$Res> {
  __$$FriendModelImplCopyWithImpl(
      _$FriendModelImpl _value, $Res Function(_$FriendModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendId = freezed,
    Object? userToken = freezed,
    Object? userName = freezed,
    Object? userProfilePhoto = freezed,
    Object? isSelect = null,
  }) {
    return _then(_$FriendModelImpl(
      friendId: freezed == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendModelImpl implements _FriendModel {
  const _$FriendModelImpl(
      {@JsonKey(name: 'friend_id') this.friendId,
      @JsonKey(name: 'user_token') this.userToken,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_profile_photo') this.userProfilePhoto,
      @JsonKey(name: 'is_select') this.isSelect = false});

  factory _$FriendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendModelImplFromJson(json);

  @override
  @JsonKey(name: 'friend_id')
  final int? friendId;
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
  @JsonKey(name: 'is_select')
  final bool isSelect;

  @override
  String toString() {
    return 'FriendModel(friendId: $friendId, userToken: $userToken, userName: $userName, userProfilePhoto: $userProfilePhoto, isSelect: $isSelect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendModelImpl &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userProfilePhoto, userProfilePhoto) ||
                other.userProfilePhoto == userProfilePhoto) &&
            (identical(other.isSelect, isSelect) ||
                other.isSelect == isSelect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, friendId, userToken, userName, userProfilePhoto, isSelect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendModelImplCopyWith<_$FriendModelImpl> get copyWith =>
      __$$FriendModelImplCopyWithImpl<_$FriendModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendModelImplToJson(
      this,
    );
  }
}

abstract class _FriendModel implements FriendModel {
  const factory _FriendModel(
      {@JsonKey(name: 'friend_id') final int? friendId,
      @JsonKey(name: 'user_token') final String? userToken,
      @JsonKey(name: 'user_name') final String? userName,
      @JsonKey(name: 'user_profile_photo') final String? userProfilePhoto,
      @JsonKey(name: 'is_select') final bool isSelect}) = _$FriendModelImpl;

  factory _FriendModel.fromJson(Map<String, dynamic> json) =
      _$FriendModelImpl.fromJson;

  @override
  @JsonKey(name: 'friend_id')
  int? get friendId;
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
  @JsonKey(name: 'is_select')
  bool get isSelect;
  @override
  @JsonKey(ignore: true)
  _$$FriendModelImplCopyWith<_$FriendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
