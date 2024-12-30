// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendProfileDetailsModel _$FriendProfileDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _FriendProfileDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$FriendProfileDetailsModel {
  @JsonKey(name: 'user_token')
  String? get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_photo')
  String? get userProfilePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'friend_id')
  int? get friendId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_token')
  String? get senderToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_token')
  String? get receiverToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_accept')
  int? get isAccept => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_friends')
  int? get totalFriends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendProfileDetailsModelCopyWith<FriendProfileDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendProfileDetailsModelCopyWith<$Res> {
  factory $FriendProfileDetailsModelCopyWith(FriendProfileDetailsModel value,
          $Res Function(FriendProfileDetailsModel) then) =
      _$FriendProfileDetailsModelCopyWithImpl<$Res, FriendProfileDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'friend_id') int? friendId,
      @JsonKey(name: 'sender_token') String? senderToken,
      @JsonKey(name: 'receiver_token') String? receiverToken,
      @JsonKey(name: 'is_accept') int? isAccept,
      @JsonKey(name: 'total_friends') int? totalFriends});
}

/// @nodoc
class _$FriendProfileDetailsModelCopyWithImpl<$Res,
        $Val extends FriendProfileDetailsModel>
    implements $FriendProfileDetailsModelCopyWith<$Res> {
  _$FriendProfileDetailsModelCopyWithImpl(this._value, this._then);

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
    Object? friendId = freezed,
    Object? senderToken = freezed,
    Object? receiverToken = freezed,
    Object? isAccept = freezed,
    Object? totalFriends = freezed,
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
      friendId: freezed == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderToken: freezed == senderToken
          ? _value.senderToken
          : senderToken // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverToken: freezed == receiverToken
          ? _value.receiverToken
          : receiverToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccept: freezed == isAccept
          ? _value.isAccept
          : isAccept // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFriends: freezed == totalFriends
          ? _value.totalFriends
          : totalFriends // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendProfileDetailsModelImplCopyWith<$Res>
    implements $FriendProfileDetailsModelCopyWith<$Res> {
  factory _$$FriendProfileDetailsModelImplCopyWith(
          _$FriendProfileDetailsModelImpl value,
          $Res Function(_$FriendProfileDetailsModelImpl) then) =
      __$$FriendProfileDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_token') String? userToken,
      @JsonKey(name: 'user_name') String? userName,
      @JsonKey(name: 'user_profile_photo') String? userProfilePhoto,
      @JsonKey(name: 'friend_id') int? friendId,
      @JsonKey(name: 'sender_token') String? senderToken,
      @JsonKey(name: 'receiver_token') String? receiverToken,
      @JsonKey(name: 'is_accept') int? isAccept,
      @JsonKey(name: 'total_friends') int? totalFriends});
}

/// @nodoc
class __$$FriendProfileDetailsModelImplCopyWithImpl<$Res>
    extends _$FriendProfileDetailsModelCopyWithImpl<$Res,
        _$FriendProfileDetailsModelImpl>
    implements _$$FriendProfileDetailsModelImplCopyWith<$Res> {
  __$$FriendProfileDetailsModelImplCopyWithImpl(
      _$FriendProfileDetailsModelImpl _value,
      $Res Function(_$FriendProfileDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToken = freezed,
    Object? userName = freezed,
    Object? userProfilePhoto = freezed,
    Object? friendId = freezed,
    Object? senderToken = freezed,
    Object? receiverToken = freezed,
    Object? isAccept = freezed,
    Object? totalFriends = freezed,
  }) {
    return _then(_$FriendProfileDetailsModelImpl(
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
      friendId: freezed == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderToken: freezed == senderToken
          ? _value.senderToken
          : senderToken // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverToken: freezed == receiverToken
          ? _value.receiverToken
          : receiverToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccept: freezed == isAccept
          ? _value.isAccept
          : isAccept // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFriends: freezed == totalFriends
          ? _value.totalFriends
          : totalFriends // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendProfileDetailsModelImpl implements _FriendProfileDetailsModel {
  const _$FriendProfileDetailsModelImpl(
      {@JsonKey(name: 'user_token') this.userToken,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_profile_photo') this.userProfilePhoto,
      @JsonKey(name: 'friend_id') this.friendId,
      @JsonKey(name: 'sender_token') this.senderToken,
      @JsonKey(name: 'receiver_token') this.receiverToken,
      @JsonKey(name: 'is_accept') this.isAccept,
      @JsonKey(name: 'total_friends') this.totalFriends});

  factory _$FriendProfileDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendProfileDetailsModelImplFromJson(json);

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
  @JsonKey(name: 'friend_id')
  final int? friendId;
  @override
  @JsonKey(name: 'sender_token')
  final String? senderToken;
  @override
  @JsonKey(name: 'receiver_token')
  final String? receiverToken;
  @override
  @JsonKey(name: 'is_accept')
  final int? isAccept;
  @override
  @JsonKey(name: 'total_friends')
  final int? totalFriends;

  @override
  String toString() {
    return 'FriendProfileDetailsModel(userToken: $userToken, userName: $userName, userProfilePhoto: $userProfilePhoto, friendId: $friendId, senderToken: $senderToken, receiverToken: $receiverToken, isAccept: $isAccept, totalFriends: $totalFriends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendProfileDetailsModelImpl &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userProfilePhoto, userProfilePhoto) ||
                other.userProfilePhoto == userProfilePhoto) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.senderToken, senderToken) ||
                other.senderToken == senderToken) &&
            (identical(other.receiverToken, receiverToken) ||
                other.receiverToken == receiverToken) &&
            (identical(other.isAccept, isAccept) ||
                other.isAccept == isAccept) &&
            (identical(other.totalFriends, totalFriends) ||
                other.totalFriends == totalFriends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userToken,
      userName,
      userProfilePhoto,
      friendId,
      senderToken,
      receiverToken,
      isAccept,
      totalFriends);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendProfileDetailsModelImplCopyWith<_$FriendProfileDetailsModelImpl>
      get copyWith => __$$FriendProfileDetailsModelImplCopyWithImpl<
          _$FriendProfileDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendProfileDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _FriendProfileDetailsModel implements FriendProfileDetailsModel {
  const factory _FriendProfileDetailsModel(
          {@JsonKey(name: 'user_token') final String? userToken,
          @JsonKey(name: 'user_name') final String? userName,
          @JsonKey(name: 'user_profile_photo') final String? userProfilePhoto,
          @JsonKey(name: 'friend_id') final int? friendId,
          @JsonKey(name: 'sender_token') final String? senderToken,
          @JsonKey(name: 'receiver_token') final String? receiverToken,
          @JsonKey(name: 'is_accept') final int? isAccept,
          @JsonKey(name: 'total_friends') final int? totalFriends}) =
      _$FriendProfileDetailsModelImpl;

  factory _FriendProfileDetailsModel.fromJson(Map<String, dynamic> json) =
      _$FriendProfileDetailsModelImpl.fromJson;

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
  @JsonKey(name: 'friend_id')
  int? get friendId;
  @override
  @JsonKey(name: 'sender_token')
  String? get senderToken;
  @override
  @JsonKey(name: 'receiver_token')
  String? get receiverToken;
  @override
  @JsonKey(name: 'is_accept')
  int? get isAccept;
  @override
  @JsonKey(name: 'total_friends')
  int? get totalFriends;
  @override
  @JsonKey(ignore: true)
  _$$FriendProfileDetailsModelImplCopyWith<_$FriendProfileDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
