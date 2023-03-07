import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/app/services/book.dart';

class BookServiceFactory {
  static Future<BookService> make() async {
    final bearerTokenService = await BearerTokenFactory.make();

    return BookService(
      DioFactory.make(bearerTokenService.getAccessToken()),
    );
  }
}
