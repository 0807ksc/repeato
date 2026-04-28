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
    expect(find.text('중2 초급 영어'), findsOneWidget);
  });

  testWidgets('Advances card on Again button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    await tester.tap(find.text('모르겠음').first);
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 1 /'), findsOneWidget);
  });

  testWidgets('Today session controls can reset progress and switch target', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    expect(find.text('세션 제어'), findsOneWidget);
    await tester.tap(find.text('헷갈림').first);
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 1 / 30'), findsOneWidget);

    await tester.tap(find.text('현재 세션 다시 시작'));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 0 / 30'), findsOneWidget);

    await tester.tap(find.text('집중 60카드'));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 0 / 60'), findsOneWidget);
  });

  testWidgets('Swipe gestures advance card (left=known, right=again)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    final card = find.byWidgetPredicate(
      (widget) =>
          widget is GestureDetector && widget.onHorizontalDragStart != null,
    );
    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    // Left swipe => known
    await tester.drag(card, const Offset(-220, 0));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 1 /'), findsOneWidget);

    // Right swipe => dont know
    await tester.drag(
      find.byWidgetPredicate(
        (widget) =>
            widget is GestureDetector && widget.onHorizontalDragStart != null,
      ),
      const Offset(220, 0),
    );
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

    await tester.drag(find.byType(Scrollable).last, const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(find.text('오늘 상태'), findsOneWidget);
    expect(find.textContaining('헷갈림 1건'), findsOneWidget);
  });

  testWidgets('Insights shows current deck progress and remaining cards', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Today').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('알겠음').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    expect(find.text('오늘 학습 덱'), findsOneWidget);
    expect(find.text('오늘 학습 덱 2개'), findsOneWidget);
    expect(find.text('중2 초급 영어 + 천자문 입문'), findsWidgets);
    expect(find.text('현재 학습 중인 덱'), findsOneWidget);
    expect(find.text('덱 전체 진행률'), findsOneWidget);
    expect(find.text('오늘 남은 카드'), findsOneWidget);
    expect(find.text('1 / 128 경험'), findsOneWidget);
    expect(find.text('29장'), findsOneWidget);
  });

  testWidgets('Insights weak summary can open Decks tab', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('모르겠음').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('약점 영역 요약'),
      160,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();

    expect(find.text('약점 영역 요약'), findsOneWidget);
    expect(find.text('기억이 거의 나지 않는 카드가 더 많습니다.'), findsOneWidget);
    expect(find.text('모르겠음 1장'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('덱 확인하기'),
      120,
      scrollable: find.byType(Scrollable).last,
    );
    final openDeckButton = find.widgetWithText(OutlinedButton, '덱 확인하기');
    expect(openDeckButton, findsOneWidget);
    await tester.tap(openDeckButton);
    await tester.pumpAndSettle();

    expect(find.text('Decks'), findsWidgets);
    expect(find.text('중2 초급 영어'), findsOneWidget);
  });

  testWidgets('Insights shows recent change and next review cards', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('알겠음').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Scrollable).last, const Offset(0, -450));
    await tester.pumpAndSettle();

    expect(find.text('최근 변화'), findsOneWidget);
    expect(find.text('다음 복습 시점'), findsOneWidget);
    expect(find.text('정답률이 안정적으로 유지되고 있습니다'), findsOneWidget);
    expect(find.textContaining('예상:'), findsWidgets);
  });

  testWidgets('Add tab validates, saves a card, and can move to Today', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch).last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add').last);
    await tester.pumpAndSettle();

    expect(find.text('오늘 학습 덱'), findsOneWidget);
    expect(find.text('현재 2개 덱이 오늘 학습에 포함돼 있습니다.'), findsOneWidget);
    expect(find.widgetWithText(ChoiceChip, '중2 초급 영어'), findsOneWidget);
    expect(find.widgetWithText(ChoiceChip, '천자문 입문'), findsOneWidget);

    final saveButton = find.widgetWithText(FilledButton, '카드 저장');
    await tester.scrollUntilVisible(
      saveButton,
      160,
      scrollable: find.byType(Scrollable).last,
    );
    final savePressed = tester.widget<FilledButton>(saveButton).onPressed;
    expect(savePressed, isNotNull);
    savePressed!();
    await tester.pumpAndSettle();
    expect(find.text('앞면을 입력해 주세요.'), findsOneWidget);
    expect(find.text('뒷면을 입력해 주세요.'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'resilient');
    await tester.enterText(fields.at(1), '회복력이 있는');
    await tester.tap(find.widgetWithText(ChoiceChip, '천자문 입문'));
    await tester.pumpAndSettle();
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      saveButton,
      160,
      scrollable: find.byType(Scrollable).last,
    );
    final savePressedAfterInput = tester
        .widget<FilledButton>(saveButton)
        .onPressed;
    expect(savePressedAfterInput, isNotNull);
    savePressedAfterInput!();
    await tester.pumpAndSettle();

    expect(find.textContaining('저장 완료'), findsOneWidget);
    await tester.tap(find.text('Today로 이동'));
    await tester.pumpAndSettle();
    expect(find.textContaining('진행: 0 /'), findsOneWidget);

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    expect(find.text('천자문 입문'), findsWidgets);
  });

  testWidgets('Deck detail can start Today and reflects custom card count', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add').last);
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'portable');
    await tester.enterText(fields.at(1), '휴대용의');
    await tester.enterText(fields.at(2), '여행 영어');
    final saveButton = find.widgetWithText(FilledButton, '카드 저장');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      saveButton,
      160,
      scrollable: find.byType(Scrollable).last,
    );
    final savePressed = tester.widget<FilledButton>(saveButton).onPressed;
    expect(savePressed, isNotNull);
    savePressed!();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('중2 초급 영어'));
    await tester.pumpAndSettle();

    expect(find.text('덱 상세'), findsOneWidget);
    expect(find.text('120개'), findsOneWidget);
    expect(find.text('0개'), findsOneWidget);

    await tester.tap(find.text('지금 바로 학습'));
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 0 /'), findsOneWidget);
  });

  testWidgets('Decks shows Cheonjamun sample deck and can study it', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();

    expect(find.text('중2 초급 영어'), findsOneWidget);
    expect(find.text('천자문 입문'), findsOneWidget);

    await tester.tap(find.text('천자문 입문'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('지금 바로 학습'));
    await tester.pumpAndSettle();

    expect(find.text('천자문 입문'), findsOneWidget);
    expect(find.text('天'), findsOneWidget);
  });

  testWidgets('Decks can include multiple decks in today study queue', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Decks').last);
    await tester.pumpAndSettle();

    final hanjaSwitch = find.byType(Switch).last;
    await tester.tap(hanjaSwitch);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Today').last);
    await tester.pumpAndSettle();

    expect(find.text('중2 초급 영어 + 천자문 입문'), findsOneWidget);
  });

  testWidgets('Insights action can move back to Today with KPI cards visible', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('헷갈림').first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Insights').last);
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Scrollable).last, const Offset(0, -300));
    await tester.pumpAndSettle();
    expect(find.text('오늘 완료율'), findsOneWidget);
    expect(find.text('정답률'), findsOneWidget);
    expect(find.text('오늘 상태'), findsOneWidget);
    expect(find.text('진행 중'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('약점 다시 학습'),
      120,
      scrollable: find.byType(Scrollable).last,
    );
    final retryButton = find.widgetWithText(FilledButton, '약점 다시 학습');
    expect(retryButton, findsOneWidget);
    await tester.scrollUntilVisible(
      retryButton,
      120,
      scrollable: find.byType(Scrollable).last,
    );
    final retryPressed = tester.widget<FilledButton>(retryButton).onPressed;
    expect(retryPressed, isNotNull);
    retryPressed!();
    await tester.pumpAndSettle();

    expect(find.textContaining('진행: 1 /'), findsOneWidget);
  });

  testWidgets('Profile shows trust summary and can resume Today', (
    WidgetTester tester,
  ) async {
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

  testWidgets('Add shows recent decks and recent entries after save', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RepeatoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add').last);
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'portable');
    await tester.enterText(fields.at(1), '휴대용의');
    await tester.enterText(fields.at(2), '여행 영어');
    tester.testTextInput.hide();
    await tester.pumpAndSettle();

    final saveButton = find.widgetWithText(FilledButton, '카드 저장');
    await tester.scrollUntilVisible(
      saveButton,
      160,
      scrollable: find.byType(Scrollable).last,
    );
    final savePressed = tester.widget<FilledButton>(saveButton).onPressed;
    expect(savePressed, isNotNull);
    savePressed!();
    await tester.pumpAndSettle();

    expect(find.text('최근 사용 덱'), findsOneWidget);
    expect(find.widgetWithText(ChoiceChip, '여행 영어'), findsOneWidget);
    expect(find.text('최근 입력'), findsOneWidget);
    expect(find.text('휴대용의 · 여행 영어'), findsOneWidget);

    final savedFields = find.byType(TextFormField);
    expect(
      tester.widget<TextFormField>(savedFields.at(0)).controller!.text,
      isEmpty,
    );
    expect(
      tester.widget<TextFormField>(savedFields.at(1)).controller!.text,
      isEmpty,
    );
    expect(
      tester.widget<TextFormField>(savedFields.at(2)).controller!.text,
      '여행 영어',
    );

    await tester.tap(find.text('다시 입력').first);
    await tester.pumpAndSettle();

    expect(
      tester.widget<TextFormField>(savedFields.at(0)).controller!.text,
      'portable',
    );
    expect(
      tester.widget<TextFormField>(savedFields.at(1)).controller!.text,
      '휴대용의',
    );
    expect(
      tester.widget<TextFormField>(savedFields.at(2)).controller!.text,
      '여행 영어',
    );
  });
}
