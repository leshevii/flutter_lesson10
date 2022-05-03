import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('login test', () {
    testWidgets('login test widgets', (WidgetTester tester) async {
      app.main();
      await tester.pump();
      expect(find.text('Вход'), findsOneWidget);
    });
  });
}
