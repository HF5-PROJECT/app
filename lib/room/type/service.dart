import 'package:dio/dio.dart';
import 'package:overnites/room/type/model.dart';

class RoomTypeService {
  RoomTypeService(this._dio);

  final Dio _dio;

  Future<List<RoomType>> getByHotelId(int hotelId) async {
    final res = await _dio.get<List<dynamic>>('/hotel/$hotelId/room_types');

    return res.data!.map<RoomType>((roomType) {
      return RoomType.fromJSON(roomType as Map<String, dynamic>);
    }).toList();
  }
}
