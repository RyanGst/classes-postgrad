import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../config/config.dart';
import 'token_inserting_interceptor.dart';

@module
abstract class DataModule {
  Dio getDio(Config config) {
    final dio = Dio(BaseOptions(baseUrl: config.baseUrl));
    dio.interceptors.add(TokenInsertingInterceptor());
    return dio;
  }
}
