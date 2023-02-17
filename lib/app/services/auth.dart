import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:overnites/app/services/bearer_token.dart';

class AuthService {
  AuthService(this._dio, this._bearerTokenService);

  final Dio _dio;
  final TokenService _bearerTokenService;

  String decodeBase64(String str) {
    //'-', '+' 62nd char of encoding,  '_', '/' 63rd char of encoding
    var output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      // Pad with trailing '='
      case 0: // No pad chars in this case
        break;
      case 2: // Two pad chars
        output += '==';
        break;
      case 3: // One pad char
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Future<bool> verifyToken(String accessToken) async {
    try {
      final payload =
          jsonDecode(decodeBase64(accessToken.split('.').elementAt(1)));

      final now = DateTime.now().millisecondsSinceEpoch / 1000;

      // ignore: avoid_dynamic_calls
      return now < (payload?['exp'] as int);
    } catch (e) {
      return false;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final accessToken = _bearerTokenService.getAccessToken();

      if (!(await verifyToken(accessToken))) {
        await _bearerTokenService.deleteAccessToken();

        if (!(await refresh())) {
          return false;
        }

        return isAuthenticated();
      }

      return true;
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
