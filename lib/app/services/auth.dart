import 'package:dio/dio.dart';

class AuthService {
  AuthService(this.dio);

  final Dio dio;

  Future<bool> verifyToken(String bearerToken) async {
    try {
      await dio.get(
        '/user',
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}),
      );
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<bool> isAuthenticated() async {
    try {
      await dio.get('/user');
      return true;
    } catch (e) {
      return false;
    }
  }
}
