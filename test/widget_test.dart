
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/app.dart';

void main() {
  testWidgets('FocusFlow app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Check if the Home Screen is displayed.
    expect(find.text('GET STARTED'), findsOneWidget);
  });
}
