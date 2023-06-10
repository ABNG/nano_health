import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nano_health/core/config/dio_config.dart';

Future<T> exceptionBuilder<T>(final call) async {
  try {
    return await call();
  } on DioException catch (e) {
    throw e.message ?? e.dioMessage;
  } catch (e) {
    log(e.toString());
    throw 'something went wrong';
  }
}
