import 'package:codonnier_network/network/api_type.dart';
import 'package:codonnier_network/network/rest_client.dart';
import 'package:codonnier_network/utils/failure.dart';
import 'package:dio/dio.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/models/request_model/accept_reject_friend_request/accept_reject_friend_request_data.dart';
import 'package:leveled_up_life/models/request_model/friend_and_request/friend_and_request_data.dart';
import 'package:leveled_up_life/models/request_model/search_friend/search_friend_data.dart';

class FriendRepo {
  Future<ResponseItem> getFriendsAndRequestList(
      FriendAndRequestData findFriendData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        findFriendData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getFriendsList,
        },
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

  Future<ResponseItem> acceptAndRejectFriendRequest(
      AcceptRejectFriendRequestData acceptRejectFriendRequestData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        acceptRejectFriendRequestData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.acceptRejectRequest},
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

  Future<ResponseItem> sendFriendRequest(String oppUserToken) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {'opp_user_token': oppUserToken},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.sendRequest},
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

  Future<ResponseItem> getFriendRequestCount() async {
    try {
      Response response = await RestClient.instance.get(
        APIType.protected,
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getFriendRequestCount,
        },
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

  Future<ResponseItem> getSearchFriend(
      SearchFriendData searchFriendData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        searchFriendData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.searchFriends},
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

  Future<ResponseItem> friendProfileDetails(String userToken) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {'user_token': userToken},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getFriendProfileDetails},
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
