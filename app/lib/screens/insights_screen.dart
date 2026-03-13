import 'package:flutter/material.dart';

import '../models/session_stats.dart';
import '../widgets/review_note_card.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({
    super.key,
    required this.stats,
    required this.onStartToday,
  });

  final SessionStats stats;
  final VoidCallback onStartToday;

  @override
  Widget build(BuildContext context) {
    final solved = stats.known + stats.unsure + stats.again;
    final accuracy = solved == 0 ? 0 : ((stats.known / solved) * 100).round();
    final completionRate = stats.target == 0 ? 0 : ((stats.completed / stats.target) * 100).round();
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
          body: '이번 반복에서는 핵심 KPI 3개와 다음 행동 연결만 강화합니다. '
              '주간/월간 추이와 장기 지표는 이벤트 스키마 확정 후 확장합니다.',
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
                Text('다음 행동', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  stats.unsure + stats.again > 0
                      ? '헷갈리거나 모르는 카드가 남아 있습니다. Today로 돌아가 다시 학습하세요.'
                      : '현재 세션 기준으로 약점 카드가 많지 않습니다. 그래도 Today에서 바로 이어갈 수 있습니다.',
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: onStartToday,
                  icon: const Icon(Icons.refresh),
                  label: const Text('약점 다시 학습'),
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
