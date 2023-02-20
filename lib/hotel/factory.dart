import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/hotel/service.dart';

class HotelServiceFactory {
  static Future<HotelService> make() async {
    return HotelService(
      DioFactory.make(
        (await BearerTokenFactory.make()).getAccessToken(),
      ),
    );
  }
}
