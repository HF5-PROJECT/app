import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/app/services/auth.dart';

class AuthServiceFactory {
  static Future<AuthService> make() async {
    return AuthService(
      DioFactory.make((await BearerTokenFactory.make()).getBearerToken()),
    );
  }
}
