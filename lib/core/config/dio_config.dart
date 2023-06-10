import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

extension DioMessage on DioException {
  String get dioMessage => error.toString();
}

final _dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    baseUrl: 'https://fakestoreapi.com/',
  ),
)..interceptors.addAll([
    AppInterceptor(),
  ]);

Dio get api => _dio;
