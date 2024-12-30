part of 'subscription_cubit.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState(
      {@Default('') String message,
      InAppPurchase? inAppPurchase,
      @Default([]) List<ProductDetails> products,
      ProductDetails? selectedProduct,
      ProductDetails? subscribedProduct,
      @Default(true) bool isForMonth,
      @Default(0) int isSubscriptionDowngrade}) = _SubscriptionState;
}
