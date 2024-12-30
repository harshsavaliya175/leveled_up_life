import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';

class SubscriptionRepo {
  Future<ResponseItem> verifyReceipt(String receiptUrl) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {"receiptUrl": receiptUrl},
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.verifyReceipt,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }

  Future<ResponseItem> getReceiptStatus() async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {},
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getReceiptStatus,
        },
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? LocaleKeys.something_went_wrong.tr(),
        status: false,
      );
    }
  }
}
