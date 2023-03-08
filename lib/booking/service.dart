import 'package:dio/dio.dart';
import 'package:overnites/booking/view/hotel_room_booking.dart';

class BookingService {
  BookingService(this._dio);

  final Dio _dio;

  Future<bool> book(
    DateTime start,
    DateTime end,
    List<BookRoomType> roomTypes,
  ) async {
    try {
      final roomTypeIds = <int>[];

      for (final roomType in roomTypes) {
        roomTypeIds.add(roomType.roomTypeId);
      }

      await _dio.post<Map<String, dynamic>>(
        '/booking/rooms',
        data: {
          //🎖️
          'start': '${start.toIso8601String()}Z',
          'end': '${end.toIso8601String()}Z',
          'roomTypeIds': roomTypeIds,
        },
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
