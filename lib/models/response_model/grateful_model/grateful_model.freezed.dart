// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grateful_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GratefulModel _$GratefulModelFromJson(Map<String, dynamic> json) {
  return _GratefulModel.fromJson(json);
}

/// @nodoc
mixin _$GratefulModel {
  @JsonKey(name: 'grateful_id')
  int get gratefulId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_token')
  String get userToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'grateful_date')
  String get gratefulDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'grateful_title')
  String get gratefulTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'grateful_img')
  String get gratefulImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GratefulModelCopyWith<GratefulModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GratefulModelCopyWith<$Res> {
  factory $GratefulModelCopyWith(
          GratefulModel value, $Res Function(GratefulModel) then) =
      _$GratefulModelCopyWithImpl<$Res, GratefulModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'grateful_id') int gratefulId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'grateful_date') String gratefulDate,
      @JsonKey(name: 'grateful_title') String gratefulTitle,
      @JsonKey(name: 'grateful_img') String gratefulImg});
}

/// @nodoc
class _$GratefulModelCopyWithImpl<$Res, $Val extends GratefulModel>
    implements $GratefulModelCopyWith<$Res> {
  _$GratefulModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gratefulId = null,
    Object? userToken = null,
    Object? gratefulDate = null,
    Object? gratefulTitle = null,
    Object? gratefulImg = null,
  }) {
    return _then(_value.copyWith(
      gratefulId: null == gratefulId
          ? _value.gratefulId
          : gratefulId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulDate: null == gratefulDate
          ? _value.gratefulDate
          : gratefulDate // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulTitle: null == gratefulTitle
          ? _value.gratefulTitle
          : gratefulTitle // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulImg: null == gratefulImg
          ? _value.gratefulImg
          : gratefulImg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GratefulModelImplCopyWith<$Res>
    implements $GratefulModelCopyWith<$Res> {
  factory _$$GratefulModelImplCopyWith(
          _$GratefulModelImpl value, $Res Function(_$GratefulModelImpl) then) =
      __$$GratefulModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'grateful_id') int gratefulId,
      @JsonKey(name: 'user_token') String userToken,
      @JsonKey(name: 'grateful_date') String gratefulDate,
      @JsonKey(name: 'grateful_title') String gratefulTitle,
      @JsonKey(name: 'grateful_img') String gratefulImg});
}

/// @nodoc
class __$$GratefulModelImplCopyWithImpl<$Res>
    extends _$GratefulModelCopyWithImpl<$Res, _$GratefulModelImpl>
    implements _$$GratefulModelImplCopyWith<$Res> {
  __$$GratefulModelImplCopyWithImpl(
      _$GratefulModelImpl _value, $Res Function(_$GratefulModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gratefulId = null,
    Object? userToken = null,
    Object? gratefulDate = null,
    Object? gratefulTitle = null,
    Object? gratefulImg = null,
  }) {
    return _then(_$GratefulModelImpl(
      gratefulId: null == gratefulId
          ? _value.gratefulId
          : gratefulId // ignore: cast_nullable_to_non_nullable
              as int,
      userToken: null == userToken
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulDate: null == gratefulDate
          ? _value.gratefulDate
          : gratefulDate // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulTitle: null == gratefulTitle
          ? _value.gratefulTitle
          : gratefulTitle // ignore: cast_nullable_to_non_nullable
              as String,
      gratefulImg: null == gratefulImg
          ? _value.gratefulImg
          : gratefulImg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GratefulModelImpl implements _GratefulModel {
  const _$GratefulModelImpl(
      {@JsonKey(name: 'grateful_id') this.gratefulId = 0,
      @JsonKey(name: 'user_token') this.userToken = '',
      @JsonKey(name: 'grateful_date') this.gratefulDate = '',
      @JsonKey(name: 'grateful_title') this.gratefulTitle = '',
      @JsonKey(name: 'grateful_img') this.gratefulImg = ''});

  factory _$GratefulModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GratefulModelImplFromJson(json);

  @override
  @JsonKey(name: 'grateful_id')
  final int gratefulId;
  @override
  @JsonKey(name: 'user_token')
  final String userToken;
  @override
  @JsonKey(name: 'grateful_date')
  final String gratefulDate;
  @override
  @JsonKey(name: 'grateful_title')
  final String gratefulTitle;
  @override
  @JsonKey(name: 'grateful_img')
  final String gratefulImg;

  @override
  String toString() {
    return 'GratefulModel(gratefulId: $gratefulId, userToken: $userToken, gratefulDate: $gratefulDate, gratefulTitle: $gratefulTitle, gratefulImg: $gratefulImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GratefulModelImpl &&
            (identical(other.gratefulId, gratefulId) ||
                other.gratefulId == gratefulId) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            (identical(other.gratefulDate, gratefulDate) ||
                other.gratefulDate == gratefulDate) &&
            (identical(other.gratefulTitle, gratefulTitle) ||
                other.gratefulTitle == gratefulTitle) &&
            (identical(other.gratefulImg, gratefulImg) ||
                other.gratefulImg == gratefulImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gratefulId, userToken,
      gratefulDate, gratefulTitle, gratefulImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GratefulModelImplCopyWith<_$GratefulModelImpl> get copyWith =>
      __$$GratefulModelImplCopyWithImpl<_$GratefulModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GratefulModelImplToJson(
      this,
    );
  }
}

abstract class _GratefulModel implements GratefulModel {
  const factory _GratefulModel(
          {@JsonKey(name: 'grateful_id') final int gratefulId,
          @JsonKey(name: 'user_token') final String userToken,
          @JsonKey(name: 'grateful_date') final String gratefulDate,
          @JsonKey(name: 'grateful_title') final String gratefulTitle,
          @JsonKey(name: 'grateful_img') final String gratefulImg}) =
      _$GratefulModelImpl;

  factory _GratefulModel.fromJson(Map<String, dynamic> json) =
      _$GratefulModelImpl.fromJson;

  @override
  @JsonKey(name: 'grateful_id')
  int get gratefulId;
  @override
  @JsonKey(name: 'user_token')
  String get userToken;
  @override
  @JsonKey(name: 'grateful_date')
  String get gratefulDate;
  @override
  @JsonKey(name: 'grateful_title')
  String get gratefulTitle;
  @override
  @JsonKey(name: 'grateful_img')
  String get gratefulImg;
  @override
  @JsonKey(ignore: true)
  _$$GratefulModelImplCopyWith<_$GratefulModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
