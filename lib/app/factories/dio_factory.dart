import 'package:dio/dio.dart';

class DioFactory {
  static Dio make(String bearerToken) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://overnites-backend.binau.dev/api',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken'
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    return dio;
  }
}
