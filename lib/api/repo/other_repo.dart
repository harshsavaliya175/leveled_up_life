import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';

class OtherRepo {
  Future<ResponseItem> getNotificationsList({
    required int page,
    required int limit,
  }) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {'page': page, 'limit': limit},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getNotificationsList},
      );
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }
}
