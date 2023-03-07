import 'package:dio/dio.dart';
import 'package:overnites/book/model.dart';

class BookService {
  BookService(this._dio);

  final Dio _dio;

  Future<List<Book>> getByHotelId(int hotelId) async {
    final res = await _dio.get<List<dynamic>>('/hotel/$hotelId/room_types');

    return res.data!.map<Book>((book) {
      return Book.fromJSON(book as Map<String, dynamic>);
    }).toList();
  }
}
