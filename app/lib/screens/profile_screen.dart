import 'package:flutter/material.dart';

import '../models/session_stats.dart';
import '../widgets/review_note_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.stats,
    required this.totalCards,
    required this.onResumeToday,
  });

  final SessionStats stats;
  final int totalCards;
  final VoidCallback onResumeToday;

  @override
  Widget build(BuildContext context) {
    final solved = stats.known + stats.unsure + stats.again;
    final accuracy = solved == 0 ? 0 : ((stats.known / solved) * 100).round();
    final statusText = solved == 0
        ? '아직 시작 전'
        : stats.done
            ? '오늘 목표 달성'
            : '오늘 학습 진행 중';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const ReviewNoteCard(
          title: '리뷰 설명',
          body: '동기화/결제는 이번 버전에서 구현하지 않습니다. 사용자 그룹에는 "로컬 설정과 상태 설명이 충분한지"만 확인합니다.',
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.insights_outlined),
            title: const Text('오늘 학습 요약'),
            subtitle: Text(
              '$statusText · ${stats.completed}/${stats.target} 진행 · 정답률 $accuracy%',
            ),
            trailing: Text('$totalCards장'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.cloud_off_outlined),
            title: const Text('로컬 저장 상태'),
            subtitle: const Text('이 기기에서만 학습 상태를 보관합니다. 동기화/결제는 아직 연결하지 않았습니다.'),
            trailing: Chip(
              label: const Text('로컬 전용'),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('약한 리마인드'),
            subtitle: Text('등교 전이나 이동 직전처럼 짧게 시작할 수 있는 시점만 부드럽게 알려줍니다.'),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('다음 행동', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  solved == 0
                      ? '오늘 세션이 아직 시작되지 않았습니다. Today에서 바로 시작할 수 있습니다.'
                      : '현재 세션이 저장돼 있습니다. Today로 돌아가 이어서 학습하세요.',
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: onResumeToday,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Today 이어서 학습'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
