import 'package:dio/dio.dart';
import 'package:overnites/hotel/model.dart';

class HotelService {
  HotelService(this._dio);

  final Dio _dio;

  Future<List<Hotel>> getHotels() async {
    final res = await _dio.get<List<dynamic>>('/hotel');

    return res.data!.map<Hotel>((hotel) {
      return Hotel.fromJSON(hotel as Map<String, dynamic>);
    }).toList();
  }
}
