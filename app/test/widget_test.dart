import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Loads Repeato app shell', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Today'), findsWidgets);
    expect(find.text('Decks'), findsOneWidget);
    expect(find.text('Insights'), findsOneWidget);
  });
}
