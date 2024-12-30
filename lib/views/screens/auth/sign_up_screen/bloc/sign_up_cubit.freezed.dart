// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get passwordVisibility => throw _privateConstructorUsedError;
  bool get confirmPasswordVisibility => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      String name,
      String email,
      String password,
      String confirmPassword,
      bool passwordVisibility,
      bool confirmPasswordVisibility});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? name = null,
    Object? email = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      String name,
      String email,
      String password,
      String confirmPassword,
      bool passwordVisibility,
      bool confirmPasswordVisibility});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? passwordVisibility = null,
    Object? confirmPasswordVisibility = null,
  }) {
    return _then(_$SignUpStateImpl(
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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

class _$SignUpStateImpl implements _SignUpState {
  const _$SignUpStateImpl(
      {this.responseItem,
      this.message = '',
      this.name = '',
      this.email = '',
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
  final String name;
  @override
  @JsonKey()
  final String email;
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
    return 'SignUpState(responseItem: $responseItem, message: $message, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, passwordVisibility: $passwordVisibility, confirmPasswordVisibility: $confirmPasswordVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
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
      name,
      email,
      password,
      confirmPassword,
      passwordVisibility,
      confirmPasswordVisibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final ResponseItem? responseItem,
      final String message,
      final String name,
      final String email,
      final String password,
      final String confirmPassword,
      final bool passwordVisibility,
      final bool confirmPasswordVisibility}) = _$SignUpStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  String get name;
  @override
  String get email;
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
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
