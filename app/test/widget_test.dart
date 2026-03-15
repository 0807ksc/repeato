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

    expect(find.text('오늘 상태'), findsOneWidget);
    expect(find.textContaining('헷갈림 1건'), findsOneWidget);
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

  testWidgets('Deck detail can start Today and reflects custom card count', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add').last);
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'portable');
    await tester.enterText(fields.at(1), '휴대용의');
    await tester.enterText(fields.at(2), '여행 영어');
    await tester.tap(find.text('카드 저장'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('중2 초급 영어 120'));
    await tester.pumpAndSettle();

    expect(find.text('Deck Detail'), findsOneWidget);
    expect(find.text('121개'), findsOneWidget);
    expect(find.text('1개'), findsOneWidget);

    await tester.tap(find.text('학습 시작'));
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 0 /'), findsOneWidget);
  });

  testWidgets('Insights action can move back to Today with KPI cards visible', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('헷갈림').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    expect(find.text('오늘 완료율'), findsOneWidget);
    expect(find.text('정답률'), findsOneWidget);
    expect(find.text('오늘 상태'), findsOneWidget);
    expect(find.text('진행 중'), findsOneWidget);

    final retryButton = find.widgetWithText(FilledButton, '약점 다시 학습');
    await tester.ensureVisible(retryButton);
    await tester.pumpAndSettle();
    await tester.tap(retryButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 1 /'), findsOneWidget);
  });

  testWidgets('Profile shows trust summary and can resume Today', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('알겠음').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();

    expect(find.text('오늘 학습 요약'), findsOneWidget);
    expect(find.textContaining('1/30 진행'), findsOneWidget);
    expect(find.text('로컬 저장 상태'), findsOneWidget);
    expect(find.text('로컬 전용'), findsOneWidget);
    expect(find.text('Today 이어서 학습'), findsOneWidget);

    final resumeButton = find.widgetWithText(FilledButton, 'Today 이어서 학습');
    await tester.ensureVisible(resumeButton);
    await tester.pumpAndSettle();
    await tester.tap(resumeButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 1 /'), findsOneWidget);
  });
}
