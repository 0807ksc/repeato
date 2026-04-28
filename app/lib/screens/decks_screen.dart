import 'package:flutter/material.dart';

import '../models/deck_summary.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({
    super.key,
    required this.decks,
    required this.todayStudyDeckIds,
    required this.onToggleTodayDeck,
    required this.onStudyDeckNow,
  });

  final List<DeckSummary> decks;
  final Set<String> todayStudyDeckIds;
  final ValueChanged<String> onToggleTodayDeck;
  final ValueChanged<String> onStudyDeckNow;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Decks', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        for (final deck in decks)
          Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(deck.name),
              subtitle: Text(
                '카드 ${deck.totalCards}개 · 직접 추가 ${deck.customCards}개 · 상태: ${todayStudyDeckIds.contains(deck.id) ? '오늘 학습 포함' : '대기'}',
              ),
              trailing: Switch(
                value: todayStudyDeckIds.contains(deck.id),
                onChanged: (_) => onToggleTodayDeck(deck.id),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => DeckDetailScreen(
                    deck: deck,
                    isSelected: todayStudyDeckIds.contains(deck.id),
                    onToggleTodayDeck: () => onToggleTodayDeck(deck.id),
                    onStudyNow: () {
                      Navigator.of(context).pop();
                      onStudyDeckNow(deck.id);
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
    required this.deck,
    required this.isSelected,
    required this.onToggleTodayDeck,
    required this.onStudyNow,
  });

  final DeckSummary deck;
  final bool isSelected;
  final VoidCallback onToggleTodayDeck;
  final VoidCallback onStudyNow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('덱 상세')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(deck.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '선택한 덱만 Today에서 바로 학습할 수 있습니다.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('카드 수'),
              subtitle: Text('${deck.totalCards}개'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('직접 추가 카드'),
              subtitle: Text('${deck.customCards}개'),
            ),
          ),
          const Card(
            child: ListTile(title: Text('다음 복습'), subtitle: Text('오늘')),
          ),
          const Card(
            child: ListTile(title: Text('일일 목표'), subtitle: Text('빠른 30카드')),
          ),
          const SizedBox(height: 16),
          if (isSelected) const Chip(label: Text('오늘 학습 포함')),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              OutlinedButton.icon(
                onPressed: onToggleTodayDeck,
                icon: const Icon(Icons.playlist_add_check),
                label: Text(isSelected ? '오늘 학습에서 제외' : '오늘 학습에 추가'),
              ),
              FilledButton.icon(
                onPressed: onStudyNow,
                icon: const Icon(Icons.play_arrow),
                label: const Text('지금 바로 학습'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
