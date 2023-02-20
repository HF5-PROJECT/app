import 'package:overnites/app/factories/box_factory.dart';
import 'package:overnites/app/services/bearer_token.dart';

class BearerTokenFactory {
  static Future<TokenService> make() async {
    return TokenService(await BoxFactory.make('overnitesStorage'));
  }
}
