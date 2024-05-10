import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:nasa_test/resourses/app_constant.dart';

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  dio.httpClientAdapter = dioAdapter;

  const path = AppConstant.nasaUrl;

  dioAdapter.onGet(
    path,
    (request) => request.reply(200, {'message': 'Successfully mocked GET!'}),
  );

  final onGetResponse = await dio.get(path);
  debugPrint(onGetResponse.data); // {message: Successfully mocked GET!}
}
