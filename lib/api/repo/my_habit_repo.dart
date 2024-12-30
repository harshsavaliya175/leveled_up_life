import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:leveled_up_life/api/request_constant.dart';
import 'package:leveled_up_life/api/response_item.dart';
import 'package:leveled_up_life/models/request_model/add_edit_habit/add_edit_habit_data.dart';
import 'package:leveled_up_life/models/request_model/get_my_habits/get_my_habits_data.dart';

class MyHabitRepo {
  Future<ResponseItem> getMyHabits(GetMyHabitsData getMyHabitsData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        getMyHabitsData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.getHabitList},
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

  Future<ResponseItem> addEditMyHabits(
      AddEditHabitData addEditHabitData) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        addEditHabitData.toJson(),
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.editHabits},
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

  Future<ResponseItem> deleteMyHabits({required int habitId}) async {
    try {
      Response response = await RestClient.instance.post(
        APIType.protected,
        {'habit_id': habitId},
        headers: requestHeader(APIType.protected),
        query: {RequestParam.service: ApiEndPoint.deleteHabits},
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
