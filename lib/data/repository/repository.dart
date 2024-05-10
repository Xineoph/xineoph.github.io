import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_test/data/models/response_model.dart';
import 'package:nasa_test/resourses/app_constant.dart';

class DataRepository {
  final _dio = Dio();

  Future<ResponseModel?> getData() async {
    try {
      Response response = await _dio.get(AppConstant.nasaUrl);
      if (response.statusCode == 200 || response.statusCode == 202) {
        return ResponseModel.fromJson(response.data);
      } else {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Exception: $e');
      return null;
    }
  }
}
