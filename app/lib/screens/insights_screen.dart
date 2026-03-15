import 'package:flutter/material.dart';

import '../models/session_stats.dart';
import '../widgets/review_note_card.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({
    super.key,
    required this.stats,
    required this.deckName,
    required this.totalCards,
    required this.onStartToday,
    required this.onOpenDeck,
  });

  final SessionStats stats;
  final String deckName;
  final int totalCards;
  final VoidCallback onStartToday;
  final VoidCallback onOpenDeck;

  @override
  Widget build(BuildContext context) {
    final solved = stats.known + stats.unsure + stats.again;
    final accuracy = solved == 0 ? 0 : ((stats.known / solved) * 100).round();
    final completionRate = stats.target == 0 ? 0 : ((stats.completed / stats.target) * 100).round();
    final deckProgressCount = stats.completed > totalCards ? totalCards : stats.completed;
    final deckProgressRate = totalCards == 0 ? 0 : ((deckProgressCount / totalCards) * 100).round();
    final todayRemaining = stats.target - stats.completed < 0 ? 0 : stats.target - stats.completed;
    final recentChangeLabel = stats.completed == 0
        ? '아직 변화 데이터가 적습니다'
        : accuracy >= 70
            ? '정답률이 안정적으로 유지되고 있습니다'
            : '재복습 비중이 높아 다시 확인이 필요합니다';
    final nextReviewLabel = todayRemaining == 0 ? '오늘 세션 마감 후 다음 묶음 계산' : '오늘 안에 다음 복습 묶음이 이어집니다';
    final weakFocus = stats.again > stats.unsure
        ? '기억이 거의 나지 않는 카드가 더 많습니다.'
        : stats.unsure > 0
            ? '헷갈리는 카드가 더 많아 빠른 재확인이 필요합니다.'
            : '뚜렷한 약점 응답은 아직 많지 않습니다.';
    final todayStatus = stats.done
        ? '오늘 목표 달성'
        : solved == 0
            ? '아직 시작 전'
            : '진행 중';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Insights', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const ReviewNoteCard(
          title: '리뷰 설명',
          body: '이번 반복에서는 현재 학습 중인 덱의 전체 진행 감각과 오늘 남은 양을 먼저 보이게 합니다. '
              '주간/월간 추이와 장기 지표는 이벤트 스키마 확정 후 확장합니다.',
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('현재 학습 중인 덱', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(deckName, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _MetricCard(
                        title: '덱 전체 진행률',
                        value: '$deckProgressRate%',
                        subtitle: '$deckProgressCount / $totalCards 경험',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MetricCard(
                        title: '오늘 남은 카드',
                        value: '$todayRemaining장',
                        subtitle: '오늘 목표 ${stats.target}장 기준',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text('핵심 KPI', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        _MetricCard(title: '오늘 완료율', value: '$completionRate%', subtitle: '${stats.completed}/${stats.target} 완료'),
        _MetricCard(title: '정답률', value: '$accuracy%', subtitle: '알겠음 ${stats.known} / 전체 $solved'),
        _MetricCard(title: '오늘 상태', value: todayStatus, subtitle: '헷갈림 ${stats.unsure}건 · 모르겠음 ${stats.again}건'),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('최근 변화', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(recentChangeLabel),
                const SizedBox(height: 6),
                Text(
                  '현재 세션 기준 ${stats.completed}장 진행 · 정답률 $accuracy%',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('다음 복습 시점', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(nextReviewLabel),
                const SizedBox(height: 6),
                Text(
                  todayRemaining == 0
                      ? '예상: 내일 오전 첫 복습 묶음이 준비됩니다.'
                      : '예상: 남은 $todayRemaining장을 마치면 바로 다음 복습 카드가 이어집니다.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('약점 영역 요약', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(weakFocus),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text('헷갈림 ${stats.unsure}장')),
                    Chip(label: Text('모르겠음 ${stats.again}장')),
                    Chip(label: Text('남은 카드 $todayRemaining장')),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('다음 행동', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  stats.unsure + stats.again > 0
                      ? '헷갈리거나 모르는 카드가 남아 있습니다. Today로 돌아가 다시 학습하세요.'
                      : '현재 세션 기준으로 약점 카드가 많지 않습니다. 그래도 Today에서 바로 이어갈 수 있습니다.',
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onStartToday,
                      icon: const Icon(Icons.refresh),
                      label: const Text('약점 다시 학습'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onOpenDeck,
                      icon: const Icon(Icons.menu_book_outlined),
                      label: const Text('덱 확인하기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
