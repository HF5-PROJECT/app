import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

class TokenService {
  TokenService(this.box);

  final String accessTokenKey = 'access_token';

  final Box<String> box;

  static String _decodeBase64(String str) {
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

  String getAccessToken() {
    final accessToken = box.get(accessTokenKey);

    if (accessToken == null) {
      return '';
    }

    return accessToken;
  }

  Future<bool> verifyToken() async {
    try {
      final accessToken = getAccessToken();

      final payload =
          jsonDecode(_decodeBase64(accessToken.split('.').elementAt(1)));

      final now = DateTime.now().millisecondsSinceEpoch / 1000;

      // ignore: avoid_dynamic_calls
      return now < (payload?['exp'] as int);
    } catch (e) {
      return false;
    }
  }

  Future<void> saveAccessToken(String accessToken) async {
    await box.put(accessTokenKey, accessToken);
  }

  Future<void> deleteAccessToken() async {
    await box.delete(accessTokenKey);
  }
}
