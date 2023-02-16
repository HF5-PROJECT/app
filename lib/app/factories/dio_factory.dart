import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio make(String bearerToken) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost/api',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken'
        },
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(CookieManager(PersistCookieJar()));
    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }
}
