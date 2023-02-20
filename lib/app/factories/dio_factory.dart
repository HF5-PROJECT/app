import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:overnites/app/factories/box_factory.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio make(String bearerToken) {
    final dio = Dio(
      BaseOptions(
//      baseUrl: 'http://localhost/api',
        baseUrl: 'https://4b0a-185-19-133-2.eu.ngrok.io/api',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken'
        },
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      CookieManager(
        PersistCookieJar(
          storage: HiveCookieStorage(),
        ),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }
}

class HiveCookieStorage implements FileStorage {
  late final Box<String> box;

  @override
  String get dir => 'CookieJarBOX';

  @override
  String? Function(Uint8List list)? readPreHandler;

  @override
  List<int> Function(String value)? writePreHandler;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) {
    return Future(() async {
      box = await BoxFactory.make(dir);
    });
  }

  @override
  Future<void> delete(String key) {
    return Future(() => box.delete(key));
  }

  @override
  Future<void> deleteAll(List<String> keys) {
    return box.deleteAll(keys);
  }

  @override
  Future<String?> read(String key) {
    return Future(() => box.get(key));
  }

  @override
  Future<void> write(String key, String value) {
    return Future(() => box.put(key, value));
  }
}
