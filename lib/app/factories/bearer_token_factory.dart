import 'package:overnites/app/factories/box_factory.dart';
import 'package:overnites/app/services/bearer_token.dart';

class BearerTokenFactory {
  static Future<BearerTokenService> make() async {
    return BearerTokenService(await BoxFactory.make('myBox'));
  }
}
