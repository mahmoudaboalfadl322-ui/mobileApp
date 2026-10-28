import 'package:flutter_test/flutter_test.dart';
import 'package:water_hydration/main.dart';

void main() {
  testWidgets('App smoke test loads InputScreen with Water Tracker title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Water Tracker'), findsOneWidget);
    expect(find.text('MALE'), findsOneWidget);
    expect(find.text('FEMALE'), findsOneWidget);
    expect(find.text('Calculate Water Intake'), findsOneWidget);
  });
}
