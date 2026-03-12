import 'package:flutter/material.dart';

import '../models/session_stats.dart';
import '../widgets/review_note_card.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key, required this.stats});

  final SessionStats stats;

  @override
  Widget build(BuildContext context) {
    final solved = stats.known + stats.unsure + stats.again;
    final accuracy = solved == 0 ? 0 : ((stats.known / solved) * 100).round();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Insights', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const ReviewNoteCard(
          title: '리뷰 설명',
          body: '이번 빌드에서는 Today의 진행 데이터가 최소한으로 연결되는지만 보여줍니다. '
              '주간/월간 추이와 약점 카드 분석은 KPI 확정 후 들어갑니다.',
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            title: const Text('오늘 진행'),
            subtitle: Text('${stats.completed}/${stats.target} 완료'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('정답률'),
            subtitle: Text('$accuracy%'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('헷갈림'),
            subtitle: Text('${stats.unsure}건'),
          ),
        ),
      ],
    );
  }
}
