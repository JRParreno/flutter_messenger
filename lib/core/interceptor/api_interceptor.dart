import 'package:dio/dio.dart';
import 'package:flutter_messenger/core/interceptor/dio_interceptor.dart';

class ApiInterceptor {
  static Dio apiInstance() {
    Dio dio = Dio();
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
