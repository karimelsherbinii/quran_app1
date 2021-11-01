import 'dart:convert';

import '/contants/strings.dart';
import 'package:dio/dio.dart';

class PostApi {
  late Dio dio;

  PostApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllPosts() async {
    try {
      Response response = await dio.get(baseUrl);
      // responsedata = response
      // ignore: avoid_print
      print(response.data['data'].toString());
      return response.data['data'];
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
