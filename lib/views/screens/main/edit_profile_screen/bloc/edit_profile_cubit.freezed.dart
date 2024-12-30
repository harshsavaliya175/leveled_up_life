// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get profilePictureImg => throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      File? file,
      String name,
      String email,
      String profilePictureImg,
      bool isForceLogout});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? file = freezed,
    Object? name = null,
    Object? email = null,
    Object? profilePictureImg = null,
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
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureImg: null == profilePictureImg
          ? _value.profilePictureImg
          : profilePictureImg // ignore: cast_nullable_to_non_nullable
              as String,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileStateImplCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$EditProfileStateImplCopyWith(_$EditProfileStateImpl value,
          $Res Function(_$EditProfileStateImpl) then) =
      __$$EditProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      File? file,
      String name,
      String email,
      String profilePictureImg,
      bool isForceLogout});
}

/// @nodoc
class __$$EditProfileStateImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$EditProfileStateImpl>
    implements _$$EditProfileStateImplCopyWith<$Res> {
  __$$EditProfileStateImplCopyWithImpl(_$EditProfileStateImpl _value,
      $Res Function(_$EditProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? file = freezed,
    Object? name = null,
    Object? email = null,
    Object? profilePictureImg = null,
    Object? isForceLogout = null,
  }) {
    return _then(_$EditProfileStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureImg: null == profilePictureImg
          ? _value.profilePictureImg
          : profilePictureImg // ignore: cast_nullable_to_non_nullable
              as String,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditProfileStateImpl implements _EditProfileState {
  const _$EditProfileStateImpl(
      {this.responseItem,
      this.message = '',
      this.file,
      this.name = '',
      this.email = '',
      this.profilePictureImg = '',
      this.isForceLogout = false});

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;
  @override
  final File? file;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String profilePictureImg;
  @override
  @JsonKey()
  final bool isForceLogout;

  @override
  String toString() {
    return 'EditProfileState(responseItem: $responseItem, message: $message, file: $file, name: $name, email: $email, profilePictureImg: $profilePictureImg, isForceLogout: $isForceLogout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePictureImg, profilePictureImg) ||
                other.profilePictureImg == profilePictureImg) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseItem, message, file,
      name, email, profilePictureImg, isForceLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      __$$EditProfileStateImplCopyWithImpl<_$EditProfileStateImpl>(
          this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {final ResponseItem? responseItem,
      final String message,
      final File? file,
      final String name,
      final String email,
      final String profilePictureImg,
      final bool isForceLogout}) = _$EditProfileStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  File? get file;
  @override
  String get name;
  @override
  String get email;
  @override
  String get profilePictureImg;
  @override
  bool get isForceLogout;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileStateImplCopyWith<_$EditProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
