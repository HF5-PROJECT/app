import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/room/type/service.dart';

class RoomTypeServiceFactory {
  static Future<RoomTypeService> make() async {
    return RoomTypeService(
      DioFactory.make(
        (await BearerTokenFactory.make()).getAccessToken(),
      ),
    );
  }
}
