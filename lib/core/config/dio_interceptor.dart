import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode != null &&
        err.response!.statusCode.toString().startsWith('4')) {
      throw '${err.response!.data}';
    }

    switch (err.response?.statusCode) {
      case 500:
        log(err.response!.data.toString());
        throw 'Internal Server Error';
    }
    super.onError(err, handler);
  }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   if (AppConfig.token != null) {
  //     log('token: ${AppConfig.token!}');
  //     options.headers['Authorization'] = AppConfig.token;
  //   }
  //   super.onRequest(options, handler);
  // }
  //
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) async {
  //   log("response is ${response.data?.toString()}");
  //   if ((response.data.runtimeType != List<dynamic>) &&
  //       response.data['token'] != null) {
  //     await preferences.setString('token', response.data['token']);
  //     AppConfig.token = response.data['token'];
  //   }
  //
  //   super.onResponse(response, handler);
  // }
}
