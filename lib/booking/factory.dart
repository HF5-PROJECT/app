import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/booking/service.dart';

class BookingServiceFactory {
  static Future<BookingService> make() async {
    final bearerTokenService = await BearerTokenFactory.make();

    return BookingService(
      DioFactory.make(bearerTokenService.getAccessToken()),
    );
  }
}
