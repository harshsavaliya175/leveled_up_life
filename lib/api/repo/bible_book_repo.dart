import 'dart:developer';

import 'package:codonnier_network/network.dart';
import 'package:codonnier_network/network/api_type.dart';
import 'package:dio/dio.dart';
import 'package:leveled_up_life/core/constants/app_constants.dart';

class BibleBookRepo {
  // Future<List<dynamic>> bibleAllBooks() async {
  //   try {
  //     Response response = await RestClient.instance.get(
  //       APIType.public,
  //       path: '$bibleApiBaseUrl/v1/bibles/bba9f40183526463-01/books',
  //       headers: bibleApiHeader,
  //       query: {},
  //     );
  //     List<dynamic> responseData = response.data['data'];
  //     return responseData;
  //   } on Failure catch (e) {
  //     log('$e');
  //     return [];
  //   }
  // }

  // Future<List<dynamic>> bibleSingleBookChapters(
  //     {required String bookId}) async {
  //   try {
  //     Response response = await RestClient.instance.get(
  //       APIType.public,
  //       path:
  //           '$bibleApiBaseUrl/v1/bibles/bba9f40183526463-01/books/$bookId/chapters',
  //       headers: bibleApiHeader,
  //       query: {},
  //     );
  //     List<dynamic> responseData = response.data['data'];
  //     return responseData;
  //   } on Failure catch (e) {
  //     log('$e');
  //     return [];
  //   }
  // }

  // Future<Map<String, dynamic>> singleChaptersDetail(
  //     {required String chapterId}) async {
  //   try {
  //     Response response = await RestClient.instance.get(
  //       APIType.public,
  //       path:
  //           '$bibleApiBaseUrl/v1/bibles/bba9f40183526463-01/chapters/$chapterId',
  //       headers: bibleApiHeader,
  //       query: {
  //         "content-type": "html",
  //         "include-notes": false,
  //         "include-titles": true,
  //         "include-chapter-numbers": false,
  //         "include-verse-numbers": true,
  //         "include-verse-spans": false,
  //       },
  //     );
  //     Map<String, dynamic> responseData = response.data['data'];
  //     return responseData;
  //   } on Failure catch (e) {
  //     log('$e');
  //     return {};
  //   }
  // }

  Future<List<dynamic>> bibleAllBooks() async {
    try {
      Response response =
          await RestClient.instance.get(APIType.public, path: bibleGetBookUrl);
      List responseData = response.data;
      return responseData;
    } on Failure catch (e) {
      log('$e');
      return [];
    }
  }

  Future<List> singleChaptersDetail({
    required int bookId,
    required int chapterId,
  }) async {
    try {
      Response response = await RestClient.instance.get(
        APIType.public,
        path: '$bibleChaptersDetailBaseUrl$bookId/$chapterId/',
      );
      List responseData = response.data;
      return responseData;
    } on Failure catch (e) {
      log('$e');
      return [];
    }
  }
}
