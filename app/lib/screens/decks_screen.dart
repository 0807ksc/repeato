import 'package:flutter/material.dart';

import '../widgets/review_note_card.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({
    super.key,
    required this.totalCards,
    required this.customCards,
    required this.onStartToday,
  });

  final int totalCards;
  final int customCards;
  final VoidCallback onStartToday;

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
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => DeckDetailScreen(
                  totalCards: totalCards,
                  customCards: customCards,
                  onStartToday: () {
                    Navigator.of(context).pop();
                    onStartToday();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DeckDetailScreen extends StatelessWidget {
  const DeckDetailScreen({
    super.key,
    required this.totalCards,
    required this.customCards,
    required this.onStartToday,
  });

  final int totalCards;
  final int customCards;
  final VoidCallback onStartToday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deck Detail')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('중2 초급 영어 120', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '오늘 복습 우선 덱 · 바로 Today로 돌아가 학습을 시작할 수 있습니다.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('카드 수'),
              subtitle: Text('$totalCards개'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('직접 추가 카드'),
              subtitle: Text('$customCards개'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('다음 복습'),
              subtitle: Text('오늘'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('일일 목표'),
              subtitle: Text('빠른 30카드'),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onStartToday,
            icon: const Icon(Icons.play_arrow),
            label: const Text('학습 시작'),
          ),
        ],
      ),
    );
  }
}
