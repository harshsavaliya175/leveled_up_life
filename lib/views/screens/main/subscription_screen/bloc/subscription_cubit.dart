// ignore: depend_on_referenced_packages
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:leveled_up_life/api/repo/subscription_repo.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/preference.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/models/response_model/user_model/user_model.dart';
import 'package:leveled_up_life/service_injector.dart';

part 'subscription_cubit.freezed.dart';
part 'subscription_state.dart';

/// IOS SUBSCRIPTION ID
const String iosMonthlySubscriptionID =
    "com.leveleduplife.subscription.monthly";
const String iosYearlySubscriptionID = "com.leveleduplife.subscription.yearly";

/// ANDROID SUBSCRIPTION ID
const String androidMonthlySubscriptionID = "";
const String androidYearlySubscriptionID = "";

String monthSubscription =
    Platform.isIOS ? iosMonthlySubscriptionID : androidMonthlySubscriptionID;
String yearSubscription =
    Platform.isIOS ? iosYearlySubscriptionID : androidYearlySubscriptionID;

// String freeSubscription = "com.subscription.free";
String freeSubscription = "";

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionRepo _subscriptionRepo;

  SubscriptionCubit(this._subscriptionRepo) : super(const SubscriptionState());

  SharedPreference preferences = si.get<SharedPreference>();

  void initData() {
    emit(const SubscriptionState());
  }

  void initializeInAppPurchase({bool isCallInitStore = false}) {
    emit(state.copyWith(inAppPurchase: InAppPurchase.instance, message: ''));
    if (isCallInitStore) {
      initStoreInfo();
    } else {
      emit(state.copyWith(
        products: defaultProducts,
        message: '',
      ));
    }
  }

  changeProduct(ProductDetails? product) {
    emit(state.copyWith(selectedProduct: product));
  }

  void changeData({bool? isForMonth, ProductDetails? product}) {
    emit(state.copyWith(
      isForMonth: isForMonth ?? state.isForMonth,
      selectedProduct: product ?? state.selectedProduct,
    ));
  }

  getSubscriptionSubtitle(String subscriptionID) {
    if (subscriptionID == freeSubscription) {
      return "Perfect for those beginning to organize their stable management";
    } else if (subscriptionID == monthSubscription) {
      return "Break your maiden with a step up in class, for more room for your growing stable";
    } else if (subscriptionID == yearSubscription) {
      return "Go gate to wire with a structure for those with a bustling stable";
    } else {
      return "";
    }
  }

  Future<void> initStoreInfo() async {
    try {
      emit(state.copyWith(message: '', isSubscriptionDowngrade: 0));
      EasyLoading.show();
      final bool available = await state.inAppPurchase?.isAvailable() ?? false;
      if (!available) {
        EasyLoading.dismiss();
        return;
      }
      if (Platform.isIOS) {
        try {
          final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
              state.inAppPurchase!
                  .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
          await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
        } catch (e) {
          if (kDebugMode) {
            print("IOS Error" "r is -----> $e");
          }
        }
      }

      List<String> kProductIds = [monthSubscription, yearSubscription];

      final ProductDetailsResponse productDetailResponse =
          await state.inAppPurchase!.queryProductDetails(kProductIds.toSet());

      if (productDetailResponse.error != null) {
        log(productDetailResponse.error!.message, name: 'IAPError');
        emit(state.copyWith(products: productDetailResponse.productDetails));

        for (ProductDetails element in productDetailResponse.productDetails) {
          // subsProductDetails.add(SubsProductDetails(
          //   id: element.id,
          //   name: element.title,
          //   description: element.description,
          //   price: element.price,
          //   currencySymbol: element.currencySymbol,
          // ));
        }
        EasyLoading.dismiss();
        return;
      }

      if (productDetailResponse.productDetails.isEmpty) {
        emit(state.copyWith(products: productDetailResponse.productDetails));
        // for (var element in productDetailResponse.productDetails) {
        //   products.add(element);
        // }
        EasyLoading.dismiss();
        return;
      }

      if (productDetailResponse.productDetails.isNotEmpty) {
        List<ProductDetails> tmpProducts = <ProductDetails>[];
        tmpProducts.add(
          ProductDetails(
            id: freeSubscription,
            title: 'Free',
            description: "User can user some free feature.",
            price: "Free",
            rawPrice: 0,
            currencyCode: "",
          ),
        );
        for (String id in kProductIds) {
          tmpProducts.add(
            productDetailResponse.productDetails.firstWhere(
              (ProductDetails element) {
                return element.id == id;
              },
            ),
          );

          for (ProductDetails element in state.products) {
            // if (element is GooglePlayProductDetails) {
            //   final ProductDetailsWrapper product = element.productDetails;
            //   // SubsProductDetails subsProductDetail =
            //   // subsProductDetails.firstWhere(
            //   //       (element) => element.id == product.productId,
            //   // );
            //   final List<SubscriptionOfferDetailsWrapper> offer =
            //       product.subscriptionOfferDetails!;
            //   for (var element1 in offer) {
            //     final List<PricingPhaseWrapper> pricingPhases =
            //         element1.pricingPhases;
            //     if (pricingPhases.length >= 2 &&
            //         pricingPhases.first.priceAmountMicros <
            //             pricingPhases[1].priceAmountMicros) {
            //       // subsProductDetail.price = pricingPhases[1].formattedPrice;
            //       // subsProductDetail.currencySymbol =
            //       //     pricingPhases[1].formattedPrice.substring(0, 1);
            //     }
            //   }
            // }
          }
        }
        UserModel? userData = preferences.getUserModel();
        ProductDetails? productDetails;

        String subscriptionProduct = userData?.subscriptionProduct ?? "";
        productDetails = tmpProducts.firstWhere(
          (ProductDetails element) => element.id == subscriptionProduct,
        );

        emit(state.copyWith(
          products: tmpProducts,
          selectedProduct: productDetails,
          subscribedProduct: productDetails,
        ));
        EasyLoading.dismiss();
        return;
      }
      EasyLoading.dismiss();
      return;
    } catch (e) {
      if (kDebugMode) {
        print("Init Subscription error is-----> $e");
      }
      EasyLoading.dismiss();
    }
  }

  buyProduct() async {
    if (state.subscribedProduct?.id == yearSubscription) return;
    if (state.selectedProduct?.id == state.subscribedProduct?.id) return;
    if (state.selectedProduct?.id == freeSubscription) return;
    emit(state.copyWith(message: ""));
    try {
      if (state.selectedProduct == null) {
        emit(state.copyWith(message: "Please select subscription."));
        return;
      }

      EasyLoading.show();
      late PurchaseParam purchaseParam;
      if (Platform.isAndroid) {
        // purchaseParam = GooglePlayPurchaseParam(productDetails: prod);
        // if (selectedIndex == 2) {
        //   await inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
        // } else {
        //   await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
        // }
      } else {
        purchaseParam = PurchaseParam(productDetails: state.selectedProduct!);
        var transactions = await SKPaymentQueueWrapper().transactions();
        for (var skPaymentTransactionWrapper in transactions) {
          SKPaymentQueueWrapper()
              .finishTransaction(skPaymentTransactionWrapper);
        }
        await state.inAppPurchase?.buyConsumable(purchaseParam: purchaseParam);
      }
      EasyLoading.dismiss();
    } catch (e) {
      print("PURCHASE ERROR : $e");
      EasyLoading.dismiss();
    }
  }

  Future<void> restoreProduct() async {
    EasyLoading.show();
    try {
      await state.inAppPurchase?.restorePurchases();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print("RESTORE ERROR : $e");
    }
  }

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) {
    bool isVerify = false;
    if (purchaseDetails.productID == monthSubscription ||
        purchaseDetails.productID == yearSubscription) {
      isVerify = true;
    } else {
      isVerify = false;
    }
    return Future<bool>.value(isVerify);
  }

  Future<void> verifyReceipt(PurchaseDetails purchaseDetail) async {
    EasyLoading.show();
    try {
      ResponseItem data = await _subscriptionRepo
          .verifyReceipt(purchaseDetail.verificationData.localVerificationData);

      UserModel? userModel = UserModel.fromJson(data.data);
      isPurchase = true;
      preferences.saveUserModel(userModel);
      int isSubscriptionDowngrade = userModel.isSubscriptionDowngrade;

      ProductDetails? tmpProd;
      if (state.products.isNotEmpty) {
        tmpProd = state.products.firstWhere((ProductDetails element) =>
            element.id == userModel.subscriptionProduct);
      }

      // if (userModel.isSubscriptionActivated == 1) {
      // preferences.putBool(SharedPreference.IS_SUBSCRIPTION_ACTIVATED, true);
      emit(
        state.copyWith(
          subscribedProduct: tmpProd,
          isSubscriptionDowngrade: isSubscriptionDowngrade,
        ),
      );
      // } else {
      //   preferences.putBool(SharedPreference.IS_SUBSCRIPTION_ACTIVATED, false);
      // }
      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
  }

  List<ProductDetails> defaultProducts = [
    ProductDetails(
      id: freeSubscription,
      title: 'Free',
      description: "User can user some free feature.",
      price: "Free",
      rawPrice: 0,
      currencyCode: "",
    ),
    ProductDetails(
      id: monthSubscription,
      title: 'Use monthly feature.',
      description: "User can get month product.",
      price: "\$9.99",
      rawPrice: 9.99,
      currencyCode: "",
    ),
    ProductDetails(
      id: yearSubscription,
      title: 'Use yearly feature.',
      description: "User can get month product.",
      price: "\$29.99",
      rawPrice: 29.99,
      currencyCode: "",
    ),
  ];

  Future<void> getReceiptStatus() async {
    EasyLoading.show();
    try {
      ResponseItem data = await _subscriptionRepo.getReceiptStatus();

      UserModel? userModel = UserModel.fromJson(data.data);
      preferences.saveUserModel(userModel);
      int isSubscriptionDowngrade = userModel.isSubscriptionDowngrade ?? 0;

      emit(state.copyWith(isSubscriptionDowngrade: isSubscriptionDowngrade));
      // if (userModel.isSubscriptionActivated == 1) {
      //   preferences.putBool(SharedPreference.IS_SUBSCRIPTION_ACTIVATED, true);
      // } else {
      //   preferences.putBool(SharedPreference.IS_SUBSCRIPTION_ACTIVATED, false);
      // }

      EasyLoading.dismiss();
    } catch (e) {
      emit(state.copyWith(message: LocaleKeys.something_went_wrong.tr()));
      EasyLoading.dismiss();
    }
  }
}

class PaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
