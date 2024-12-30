// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AffirmationState {
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isPaginationLoader => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<AffirmationModel> get affirmationModelList =>
      throw _privateConstructorUsedError;
  String get addAffirmationText => throw _privateConstructorUsedError;
  bool get isForceLogout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AffirmationStateCopyWith<AffirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationStateCopyWith<$Res> {
  factory $AffirmationStateCopyWith(
          AffirmationState value, $Res Function(AffirmationState) then) =
      _$AffirmationStateCopyWithImpl<$Res, AffirmationState>;
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      String date,
      List<AffirmationModel> affirmationModelList,
      String addAffirmationText,
      bool isForceLogout});
}

/// @nodoc
class _$AffirmationStateCopyWithImpl<$Res, $Val extends AffirmationState>
    implements $AffirmationStateCopyWith<$Res> {
  _$AffirmationStateCopyWithImpl(this._value, this._then);

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
    Object? date = null,
    Object? affirmationModelList = null,
    Object? addAffirmationText = null,
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
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isPaginationLoader: null == isPaginationLoader
          ? _value.isPaginationLoader
          : isPaginationLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationModelList: null == affirmationModelList
          ? _value.affirmationModelList
          : affirmationModelList // ignore: cast_nullable_to_non_nullable
              as List<AffirmationModel>,
      addAffirmationText: null == addAffirmationText
          ? _value.addAffirmationText
          : addAffirmationText // ignore: cast_nullable_to_non_nullable
              as String,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffirmationStateImplCopyWith<$Res>
    implements $AffirmationStateCopyWith<$Res> {
  factory _$$AffirmationStateImplCopyWith(_$AffirmationStateImpl value,
          $Res Function(_$AffirmationStateImpl) then) =
      __$$AffirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseItem? responseItem,
      String message,
      int page,
      bool isPaginationLoader,
      String date,
      List<AffirmationModel> affirmationModelList,
      String addAffirmationText,
      bool isForceLogout});
}

/// @nodoc
class __$$AffirmationStateImplCopyWithImpl<$Res>
    extends _$AffirmationStateCopyWithImpl<$Res, _$AffirmationStateImpl>
    implements _$$AffirmationStateImplCopyWith<$Res> {
  __$$AffirmationStateImplCopyWithImpl(_$AffirmationStateImpl _value,
      $Res Function(_$AffirmationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseItem = freezed,
    Object? message = null,
    Object? page = null,
    Object? isPaginationLoader = null,
    Object? date = null,
    Object? affirmationModelList = null,
    Object? addAffirmationText = null,
    Object? isForceLogout = null,
  }) {
    return _then(_$AffirmationStateImpl(
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      affirmationModelList: null == affirmationModelList
          ? _value._affirmationModelList
          : affirmationModelList // ignore: cast_nullable_to_non_nullable
              as List<AffirmationModel>,
      addAffirmationText: null == addAffirmationText
          ? _value.addAffirmationText
          : addAffirmationText // ignore: cast_nullable_to_non_nullable
              as String,
      isForceLogout: null == isForceLogout
          ? _value.isForceLogout
          : isForceLogout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AffirmationStateImpl implements _AffirmationState {
  const _$AffirmationStateImpl(
      {this.responseItem,
      this.message = '',
      this.page = 1,
      this.isPaginationLoader = false,
      this.date = '',
      final List<AffirmationModel> affirmationModelList = const [],
      this.addAffirmationText = '',
      this.isForceLogout = false})
      : _affirmationModelList = affirmationModelList;

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
  final String date;
  final List<AffirmationModel> _affirmationModelList;
  @override
  @JsonKey()
  List<AffirmationModel> get affirmationModelList {
    if (_affirmationModelList is EqualUnmodifiableListView)
      return _affirmationModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affirmationModelList);
  }

  @override
  @JsonKey()
  final String addAffirmationText;
  @override
  @JsonKey()
  final bool isForceLogout;

  @override
  String toString() {
    return 'AffirmationState(responseItem: $responseItem, message: $message, page: $page, isPaginationLoader: $isPaginationLoader, date: $date, affirmationModelList: $affirmationModelList, addAffirmationText: $addAffirmationText, isForceLogout: $isForceLogout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffirmationStateImpl &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isPaginationLoader, isPaginationLoader) ||
                other.isPaginationLoader == isPaginationLoader) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._affirmationModelList, _affirmationModelList) &&
            (identical(other.addAffirmationText, addAffirmationText) ||
                other.addAffirmationText == addAffirmationText) &&
            (identical(other.isForceLogout, isForceLogout) ||
                other.isForceLogout == isForceLogout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      responseItem,
      message,
      page,
      isPaginationLoader,
      date,
      const DeepCollectionEquality().hash(_affirmationModelList),
      addAffirmationText,
      isForceLogout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffirmationStateImplCopyWith<_$AffirmationStateImpl> get copyWith =>
      __$$AffirmationStateImplCopyWithImpl<_$AffirmationStateImpl>(
          this, _$identity);
}

abstract class _AffirmationState implements AffirmationState {
  const factory _AffirmationState(
      {final ResponseItem? responseItem,
      final String message,
      final int page,
      final bool isPaginationLoader,
      final String date,
      final List<AffirmationModel> affirmationModelList,
      final String addAffirmationText,
      final bool isForceLogout}) = _$AffirmationStateImpl;

  @override
  ResponseItem? get responseItem;
  @override
  String get message;
  @override
  int get page;
  @override
  bool get isPaginationLoader;
  @override
  String get date;
  @override
  List<AffirmationModel> get affirmationModelList;
  @override
  String get addAffirmationText;
  @override
  bool get isForceLogout;
  @override
  @JsonKey(ignore: true)
  _$$AffirmationStateImplCopyWith<_$AffirmationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
