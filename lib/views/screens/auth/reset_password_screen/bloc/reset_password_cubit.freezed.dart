// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get passwordVisibility => throw _privateConstructorUsedError;
  bool get confirmPasswordVisibility => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      String verificationCode,
      String password,
      String confirmPassword,
      bool passwordVisibility,
      bool confirmPasswordVisibility});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? verificationCode = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? passwordVisibility = null,
    Object? confirmPasswordVisibility = null,
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
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordVisibility: null == passwordVisibility
          ? _value.passwordVisibility
          : passwordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordVisibility: null == confirmPasswordVisibility
          ? _value.confirmPasswordVisibility
          : confirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      String verificationCode,
      String password,
      String confirmPassword,
      bool passwordVisibility,
      bool confirmPasswordVisibility});
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? verificationCode = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? passwordVisibility = null,
    Object? confirmPasswordVisibility = null,
  }) {
    return _then(_$ResetPasswordStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordVisibility: null == passwordVisibility
          ? _value.passwordVisibility
          : passwordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordVisibility: null == confirmPasswordVisibility
          ? _value.confirmPasswordVisibility
          : confirmPasswordVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateImpl implements _ResetPasswordState {
  const _$ResetPasswordStateImpl(
      {this.responseItem,
      this.message = '',
      this.verificationCode = '',
      this.password = '',
      this.confirmPassword = '',
      this.passwordVisibility = false,
      this.confirmPasswordVisibility = false});

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String verificationCode;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final bool passwordVisibility;
  @override
  @JsonKey()
  final bool confirmPasswordVisibility;

  @override
  String toString() {
    return 'ResetPasswordState(responseItem: $responseItem, message: $message, verificationCode: $verificationCode, password: $password, confirmPassword: $confirmPassword, passwordVisibility: $passwordVisibility, confirmPasswordVisibility: $confirmPasswordVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.passwordVisibility, passwordVisibility) ||
                other.passwordVisibility == passwordVisibility) &&
            (identical(other.confirmPasswordVisibility,
                    confirmPasswordVisibility) ||
                other.confirmPasswordVisibility == confirmPasswordVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      verificationCode,
      password,
      confirmPassword,
      passwordVisibility,
      confirmPasswordVisibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
      {final ResponseItem? responseItem,
      final String message,
      final String verificationCode,
      final String password,
      final String confirmPassword,
      final bool passwordVisibility,
      final bool confirmPasswordVisibility}) = _$ResetPasswordStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  String get verificationCode;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  bool get passwordVisibility;
  @override
  bool get confirmPasswordVisibility;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
