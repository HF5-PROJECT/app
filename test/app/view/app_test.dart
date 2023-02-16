import 'package:flutter_test/flutter_test.dart';
import 'package:overnites/app/app.dart';
import 'package:overnites/hotel/view/hotel.dart';

void main() {
  group('App', () {
    testWidgets('renders HotelPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HotelPage), findsOneWidget);
    });
  });
}
