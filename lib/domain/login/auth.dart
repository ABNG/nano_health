import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/config/exception_builder.dart';
import '../../data/api/login/auth.dart';

part 'auth.g.dart';

@riverpod
Future<String?> loginUser(LoginUserRef ref, Map<String, dynamic> data) async {
  return exceptionBuilder(() async {
    return await Auth().loginUser(data);
  });
}
