import 'package:flutter_test/flutter_test.dart';
import 'package:overnites/app/app.dart';
import 'package:overnites/login/login.dart';

void main() {
  group('App', () {
    testWidgets('renders LoginPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
