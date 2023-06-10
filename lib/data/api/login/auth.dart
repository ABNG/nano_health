import 'package:dio/dio.dart';

import '../../../core/config/dio_config.dart';

class Auth {
  Future<String?> loginUser(Map<String, dynamic> data) async {
    Response response = await api.post('auth/login', data: data);
    return response.data == null ? null : response.data['token'];
  }
}
