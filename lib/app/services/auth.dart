import 'package:dio/dio.dart';
import 'package:overnites/app/services/bearer_token.dart';

class AuthService {
  AuthService(this._dio, this._bearerTokenService);

  final Dio _dio;
  final TokenService _bearerTokenService;

  Future<bool> isAuthenticated() async {
    try {
      if (await _bearerTokenService.verifyToken()) {
        return true;
      }

      await _bearerTokenService.deleteAccessToken();

      return await refresh();
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final accessToken = res.data?['accessToken'];
      await _bearerTokenService.saveAccessToken(accessToken as String);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> refresh() async {
    try {
      final res =
          await _dio.post<Map<String, dynamic>>('/auth/refresh', data: {});

      final accessToken = res.data?['accessToken'];
      await _bearerTokenService.saveAccessToken(accessToken as String);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _dio.post<Map<String, dynamic>>('/auth/logout', data: {});

      await _bearerTokenService.deleteAccessToken();

      return true;
    } catch (e) {
      return false;
    }
  }
}
