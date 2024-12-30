import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/subscription_screen/bloc/subscription_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late StreamSubscription<List<PurchaseDetails>> subscription;
  final GlobalKey freePlan = GlobalKey();

  @override
  void initState() {
    SubscriptionCubit subscriptionCubit =
        BlocProvider.of<SubscriptionCubit>(context);

    final Stream<List<PurchaseDetails>> purchaseUpdated =
        subscriptionCubit.state.inAppPurchase!.purchaseStream;

    subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailList) {
      listenToPurchaseUpdated(purchaseDetailList, subscriptionCubit);
    }, onDone: () {
      subscription.cancel();
    }, onError: (error) {
      // log('$error', name: LocaleKeys.app_name.translatedText());
    });
    super.initState();
  }

  Future<void> listenToPurchaseUpdated(
    List<PurchaseDetails> purchaseDetailList,
    SubscriptionCubit subscriptionCubit,
  ) async {
    for (PurchaseDetails purchaseDetails in purchaseDetailList) {
      print("purchaseDetails.status : ${purchaseDetails.status}");
      if (purchaseDetails.status == PurchaseStatus.pending) {
        EasyLoading.show();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error ||
            purchaseDetails.status == PurchaseStatus.canceled) {
          EasyLoading.dismiss();
          if (purchaseDetails.error != null) {
            log('${purchaseDetails.error!}', name: 'IAPError');
          }
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool isValid =
              await subscriptionCubit.verifyPurchase(purchaseDetails);

          if (purchaseDetails.pendingCompletePurchase) {
            await subscriptionCubit.state.inAppPurchase!
                .completePurchase(purchaseDetails);
          }
          if (isValid) {
            if (Platform.isAndroid) {
              // updateGoogleCloudStatus(
              //     purchaseDetails as GooglePlayPurchaseDetails);
              break;
            } else if (Platform.isIOS) {
              subscriptionCubit.verifyReceipt(purchaseDetails);
              break;
            }
          }

          EasyLoading.dismiss();
        }
      }
    }
  }

  Future<bool> deliverProduct(PurchaseDetails purchaseDetails) async {
    return false;
  }

  @override
  void dispose() {
    // SubscriptionCubit subscriptionCubit =
    //     BlocProvider.of<SubscriptionCubit>(context);
    if (Platform.isIOS) {
      // final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      //     subscriptionCubit.state.inAppPurchase!
      //         .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      // iosPlatformAddition.setDelegate(null);
    }
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SubscriptionCubit subscriptionCubit =
        BlocProvider.of<SubscriptionCubit>(context);
    Size size = context.getScreenSize;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          title: LocaleKeys.subscription.tr(),
          displayLeading: true,
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
          builder: (BuildContext context, SubscriptionState state) {
            return Column(
              children: [
                12.gapSpace(),
                Center(
                  child: Container(
                    height: 5,
                    width: 70,
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                10.gapSpace(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                            state.products.length,
                            (int index) {
                              return ProductDetailCard(
                                id: state.products[index].id,
                                price: state.products[index].price,
                                isCheck: state.products[index].id ==
                                    state.selectedProduct?.id,
                                onTap: () {
                                  context
                                      .read<SubscriptionCubit>()
                                      .changeProduct(state.products[index]);
                                },
                              );
                            },
                          ),
                        ),
                        20.gapSpace(),
                        Table(
                          border: const TableBorder.symmetric(
                            inside: BorderSide(color: coolThreeColor),
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          children: [
                            const TableRow(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: FontFamily.avenirNextRegular,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Free",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontFamily: FontFamily.avenirNextDemi,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Premium",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontFamily: FontFamily.avenirNextDemi,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _buildTableRow(
                              '30-day challenge',
                              false,
                              true,
                            ),
                            _buildTableRow(
                              'Add custom challenge',
                              false,
                              true,
                            ),
                            _buildTableRow(
                              'Add grateful',
                              true,
                              true,
                            ),
                            _buildTableRow(
                              'Add grateful with image',
                              false,
                              true,
                            ),
                            _buildTableRow(
                              'Add my habits',
                              true,
                              true,
                            ),
                            _buildTableRow(
                              'Set notification for my habits',
                              false,
                              true,
                            ),
                            _buildTableRow(
                              'Add affirmation',
                              true,
                              true,
                            ),
                            _buildTableRow(
                              'Set notification for affirmation',
                              false,
                              true,
                            ),
                            _buildTableRow(
                              'Set notification for motivations quotes',
                              false,
                              true,
                            ),
                          ],
                        ),
                        10.gapSpace(),
                        InkWell(
                          borderRadius: BorderRadius.circular(3),
                          splashColor: primaryColor,
                          child: const Text(
                            "Restore",
                            style: TextStyle(color: primaryColor),
                          ),
                          onTap: () {
                            context.read<SubscriptionCubit>().restoreProduct();
                          },
                        ),
                        10.gapSpace(),
                        Column(
                          children: [
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: Platform.isIOS
                                        ? subsTermsTextIOS
                                        : subsTermsTextAndroid,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: <InlineSpan>[
                                  const TextSpan(
                                    text: forMoreInfo,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termsOfUse,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // if (!await launchUrl(
                                        //     Uri.parse(Keys
                                        //         .termsOfUseWebUrl))) {
                                        //   throw Exception(
                                        //       'Could not launch ${Keys.termsOfUseWebUrl}');
                                        // }
                                        termsAndConditionLink.launchUrlFun();
                                      },
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: and,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicyLabel,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // if (!await launchUrl(
                                        //     Uri.parse(Keys
                                        //         .privacyPolicyWebUrl))) {
                                        //   throw Exception(
                                        //       'Could not launch ${Keys.privacyPolicyWebUrl}');
                                        // }
                                        privacyPolicyLink.launchUrlFun();
                                      },
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ".",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ).paddingOnly(
                          left: 25,
                          right: 25,
                          bottom: 25,
                        ),
                      ],
                    ).paddingOnly(top: 12, left: 20, right: 20),
                  ),
                ),
                AppButton(
                  fixedSize: WidgetStatePropertyAll(Size(size.width, 60)),
                  onTap: () {
                    context.read<SubscriptionCubit>().buyProduct();
                  },
                  appButtonColor: (state.selectedProduct?.id ==
                              state.subscribedProduct?.id ||
                          state.selectedProduct?.id == "" ||
                          state.subscribedProduct?.id == yearSubscription)
                      ? coolFourColor
                      : null,
                  child: Text(
                    state.selectedProduct?.id == state.subscribedProduct?.id
                        ? LocaleKeys.subscribed.tr()
                        : LocaleKeys.subscribe.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.avenirNextBold,
                      color: Colors.white,
                    ),
                  ),
                ).paddingOnly(left: 20, right: 20, top: 20, bottom: 20),
                // AppTextButton(
                //   // style: TextButton.styleFrom(
                //   //     minimumSize: Size.zero,
                //   //     padding: const EdgeInsets.only(bottom: 12),
                //   //     tapTargetSize:
                //   //         MaterialTapTargetSize.shrinkWrap),
                //   onPressed: () => context
                //       .read<SubscriptionCubit>()
                //       .restoreProduct(),
                //   text: "Restore",
                //   // child: const Text(
                //   //   "Restore",
                //   //   style: TextStyle(color: primaryColor),
                //   // ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

TableRow _buildTableRow(String feature, bool freeAvailable, bool proAvailable) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          feature,
          style: const TextStyle(
            color: primaryColor,
            fontFamily: FontFamily.avenirNextRegular,
          ),
        ),
      ),
      _buildCheckIcon(freeAvailable),
      _buildCheckIcon(proAvailable),
    ],
  );
}

Widget _buildCheckIcon(bool available) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Icon(
        available ? Icons.check_circle : Icons.cancel,
        color: available ? primaryColor : coolSixColor,
        size: 20,
      ),
    ),
  );
}

class ProductDetailCard extends StatelessWidget {
  final String price;
  final String id;
  final bool isCheck;
  final VoidCallback onTap;

  const ProductDetailCard({
    super.key,
    required this.price,
    required this.id,
    required this.onTap,
    this.isCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: coolOneColor,
            border: isCheck ? Border.all(color: primaryColor, width: 1) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontFamily: FontFamily.avenirNextDemi,
                    ),
                  ),
                  Text(
                    id == iosMonthlySubscriptionID
                        ? LocaleKeys.per_month.tr()
                        : id == iosYearlySubscriptionID
                            ? LocaleKeys.per_year.tr()
                            : "Free",
                    style: const TextStyle(fontSize: 12, color: lightGreyColor),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
                width: 16,
                child: Checkbox(
                  value: isCheck,
                  activeColor: buttonColor,
                  side: const BorderSide(
                    color: buttonColor,
                    width: 1,
                  ),
                  onChanged: (bool? value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
