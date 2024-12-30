import 'dart:io';

import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';
import 'package:leveled_up_life/models/request_model/add_affirmation/add_affirmation_data.dart';
import 'package:leveled_up_life/models/request_model/get_affirmation_list_data/get_affirmation_list_data.dart';
import 'package:leveled_up_life/models/request_model/get_grateful_list/get_grateful_list_data.dart';

class GratefulAndAffirmationRepo {
  Future<ResponseItem> getGratefulList(
      GetGratefulListData getGratefulListData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        getGratefulListData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getGratefulList,
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

  Future<ResponseItem> getAffirmationList(
      GetAffirmationListData getAffirmationListData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        getAffirmationListData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.getAffirmationList,
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

  Future<ResponseItem> addEditGrateful({
    bool isEdit = false,
    String gratefulId = '',
    required String gratefulTitle,
    required String gratefulDate,
    File? uploadImage,
  }) async {
    try {
      Response response = await RestClient.instance.postFormData(
        APIType.protected,
        {
          'type': isEdit ? edit : add,
          'grateful_id': gratefulId,
          'grateful_title': gratefulTitle,
          'grateful_date': gratefulDate,
          if (uploadImage != null)
            'grateful_img': await MultipartFile.fromFile(
              uploadImage.path,
              filename: uploadImage.path.split('/').last,
            )
        },
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.editGrateful,
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

  Future<ResponseItem> addAffirmation(
      AddAffirmationData addAffirmationData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        addAffirmationData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {
          RequestParam.service: ApiEndPoint.addAffirmation,
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
}
