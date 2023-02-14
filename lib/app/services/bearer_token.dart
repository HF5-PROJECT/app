import 'package:hive_flutter/adapters.dart';

class BearerTokenService {
  BearerTokenService(this.box);

  final String bearerTokenKey = 'bearer_token';

  final Box<String> box;

  String getBearerToken() {
    final bearerToken = box.get(bearerTokenKey);

    if (bearerToken == null) {
      return '';
    }

    return bearerToken;
  }

  Future<void> saveBearerToken(String bearerToken) async {
    await box.put(bearerTokenKey, bearerToken);
  }

  Future<void> deleteBearerToken() async {
    await box.delete(bearerTokenKey);
  }
}
