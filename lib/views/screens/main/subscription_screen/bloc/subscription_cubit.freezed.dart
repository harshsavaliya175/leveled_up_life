// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionState {
  String get message => throw _privateConstructorUsedError;
  InAppPurchase? get inAppPurchase => throw _privateConstructorUsedError;
  List<ProductDetails> get products => throw _privateConstructorUsedError;
  ProductDetails? get selectedProduct => throw _privateConstructorUsedError;
  ProductDetails? get subscribedProduct => throw _privateConstructorUsedError;
  bool get isForMonth => throw _privateConstructorUsedError;
  int get isSubscriptionDowngrade => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
  @useResult
  $Res call(
      {String message,
      InAppPurchase? inAppPurchase,
      List<ProductDetails> products,
      ProductDetails? selectedProduct,
      ProductDetails? subscribedProduct,
      bool isForMonth,
      int isSubscriptionDowngrade});
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? inAppPurchase = freezed,
    Object? products = null,
    Object? selectedProduct = freezed,
    Object? subscribedProduct = freezed,
    Object? isForMonth = null,
    Object? isSubscriptionDowngrade = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      inAppPurchase: freezed == inAppPurchase
          ? _value.inAppPurchase
          : inAppPurchase // ignore: cast_nullable_to_non_nullable
              as InAppPurchase?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetails?,
      subscribedProduct: freezed == subscribedProduct
          ? _value.subscribedProduct
          : subscribedProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetails?,
      isForMonth: null == isForMonth
          ? _value.isForMonth
          : isForMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscriptionDowngrade: null == isSubscriptionDowngrade
          ? _value.isSubscriptionDowngrade
          : isSubscriptionDowngrade // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionStateImplCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$$SubscriptionStateImplCopyWith(_$SubscriptionStateImpl value,
          $Res Function(_$SubscriptionStateImpl) then) =
      __$$SubscriptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      InAppPurchase? inAppPurchase,
      List<ProductDetails> products,
      ProductDetails? selectedProduct,
      ProductDetails? subscribedProduct,
      bool isForMonth,
      int isSubscriptionDowngrade});
}

/// @nodoc
class __$$SubscriptionStateImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SubscriptionStateImpl>
    implements _$$SubscriptionStateImplCopyWith<$Res> {
  __$$SubscriptionStateImplCopyWithImpl(_$SubscriptionStateImpl _value,
      $Res Function(_$SubscriptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? inAppPurchase = freezed,
    Object? products = null,
    Object? selectedProduct = freezed,
    Object? subscribedProduct = freezed,
    Object? isForMonth = null,
    Object? isSubscriptionDowngrade = null,
  }) {
    return _then(_$SubscriptionStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      inAppPurchase: freezed == inAppPurchase
          ? _value.inAppPurchase
          : inAppPurchase // ignore: cast_nullable_to_non_nullable
              as InAppPurchase?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetails?,
      subscribedProduct: freezed == subscribedProduct
          ? _value.subscribedProduct
          : subscribedProduct // ignore: cast_nullable_to_non_nullable
              as ProductDetails?,
      isForMonth: null == isForMonth
          ? _value.isForMonth
          : isForMonth // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscriptionDowngrade: null == isSubscriptionDowngrade
          ? _value.isSubscriptionDowngrade
          : isSubscriptionDowngrade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubscriptionStateImpl
    with DiagnosticableTreeMixin
    implements _SubscriptionState {
  const _$SubscriptionStateImpl(
      {this.message = '',
      this.inAppPurchase,
      final List<ProductDetails> products = const [],
      this.selectedProduct,
      this.subscribedProduct,
      this.isForMonth = true,
      this.isSubscriptionDowngrade = 0})
      : _products = products;

  @override
  @JsonKey()
  final String message;
  @override
  final InAppPurchase? inAppPurchase;
  final List<ProductDetails> _products;
  @override
  @JsonKey()
  List<ProductDetails> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final ProductDetails? selectedProduct;
  @override
  final ProductDetails? subscribedProduct;
  @override
  @JsonKey()
  final bool isForMonth;
  @override
  @JsonKey()
  final int isSubscriptionDowngrade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionState(message: $message, inAppPurchase: $inAppPurchase, products: $products, selectedProduct: $selectedProduct, subscribedProduct: $subscribedProduct, isForMonth: $isForMonth, isSubscriptionDowngrade: $isSubscriptionDowngrade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubscriptionState'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('inAppPurchase', inAppPurchase))
      ..add(DiagnosticsProperty('products', products))
      ..add(DiagnosticsProperty('selectedProduct', selectedProduct))
      ..add(DiagnosticsProperty('subscribedProduct', subscribedProduct))
      ..add(DiagnosticsProperty('isForMonth', isForMonth))
      ..add(DiagnosticsProperty(
          'isSubscriptionDowngrade', isSubscriptionDowngrade));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.inAppPurchase, inAppPurchase) ||
                other.inAppPurchase == inAppPurchase) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.subscribedProduct, subscribedProduct) ||
                other.subscribedProduct == subscribedProduct) &&
            (identical(other.isForMonth, isForMonth) ||
                other.isForMonth == isForMonth) &&
            (identical(
                    other.isSubscriptionDowngrade, isSubscriptionDowngrade) ||
                other.isSubscriptionDowngrade == isSubscriptionDowngrade));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      inAppPurchase,
      const DeepCollectionEquality().hash(_products),
      selectedProduct,
      subscribedProduct,
      isForMonth,
      isSubscriptionDowngrade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      __$$SubscriptionStateImplCopyWithImpl<_$SubscriptionStateImpl>(
          this, _$identity);
}

abstract class _SubscriptionState implements SubscriptionState {
  const factory _SubscriptionState(
      {final String message,
      final InAppPurchase? inAppPurchase,
      final List<ProductDetails> products,
      final ProductDetails? selectedProduct,
      final ProductDetails? subscribedProduct,
      final bool isForMonth,
      final int isSubscriptionDowngrade}) = _$SubscriptionStateImpl;

  @override
  String get message;
  @override
  InAppPurchase? get inAppPurchase;
  @override
  List<ProductDetails> get products;
  @override
  ProductDetails? get selectedProduct;
  @override
  ProductDetails? get subscribedProduct;
  @override
  bool get isForMonth;
  @override
  int get isSubscriptionDowngrade;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
