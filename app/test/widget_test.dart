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

    await tester.tap(find.text('모르겠음').first);
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

    // Right swipe => dont know
    await tester.drag(card, const Offset(220, 0));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 2 /'), findsOneWidget);
  });

  testWidgets('Tracks unsure answers in insights', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('헷갈림').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    expect(find.text('헷갈림'), findsWidgets);
    expect(find.text('1건'), findsOneWidget);
  });

  testWidgets('Add tab validates, saves a card, and can move to Today', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('카드 저장'));
    await tester.pumpAndSettle();
    expect(find.text('앞면을 입력해 주세요.'), findsOneWidget);
    expect(find.text('뒷면을 입력해 주세요.'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'resilient');
    await tester.enterText(fields.at(1), '회복력이 있는');
    await tester.enterText(fields.at(2), '여행 영어');
    await tester.tap(find.text('카드 저장'));
    await tester.pumpAndSettle();

    expect(find.textContaining('저장 완료'), findsOneWidget);
    await tester.tap(find.text('Today로 이동'));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('카드 121개'), findsOneWidget);
  });
}
