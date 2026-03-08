import 'package:flutter/material.dart';

import '../widgets/review_note_card.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({super.key, required this.totalCards});

  final int totalCards;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Decks', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const ReviewNoteCard(
          title: '리뷰 설명',
          body: '이번 단계에서는 덱 정렬 기준과 Today 연결 흐름을 검토합니다. '
              '실제 편집/중지는 다음 개발 반복에서 들어갑니다.',
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('중2 초급 영어 120'),
            subtitle: Text('카드 $totalCards개 · 다음 복습: 오늘 · 상태: 진행 중'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
