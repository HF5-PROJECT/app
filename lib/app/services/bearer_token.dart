import 'package:hive_flutter/adapters.dart';

class TokenService {
  TokenService(this.box);

  final String accessTokenKey = 'access_token';

  final Box<String> box;

  String getAccessToken() {
    final accessToken = box.get(accessTokenKey);

    if (accessToken == null) {
      return '';
    }

    return accessToken;
  }

  Future<void> saveAccessToken(String accessToken) async {
    await box.put(accessTokenKey, accessToken);
  }

  Future<void> deleteAccessToken() async {
    await box.delete(accessTokenKey);
  }
}
