import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String? baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? "https://mock-api.calleyacd.com/api",
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    );
  }
}
