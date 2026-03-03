import 'package:flutter/material.dart';
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

  testWidgets('Advances card on Again button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    await tester.tap(find.text('다시 보기').first);
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 1 /'), findsOneWidget);
  });

  testWidgets('Swipe gestures advance card (left=known, right=again)', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    final card = find.byType(Card).first;
    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    // Left swipe => known
    await tester.drag(card, const Offset(-220, 0));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 1 /'), findsOneWidget);

    // Right swipe => again
    await tester.drag(card, const Offset(220, 0));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 2 /'), findsOneWidget);
  });
}
