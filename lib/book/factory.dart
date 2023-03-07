import 'package:overnites/app/factories/bearer_token_factory.dart';
import 'package:overnites/app/factories/dio_factory.dart';
import 'package:overnites/book/service.dart';

class BookServiceFactory {
  static Future<BookService> make() async {
    return BookService(
      DioFactory.make(
        (await BearerTokenFactory.make()).getAccessToken(),
      ),
    );
  }
}
