import 'package:flutter/material.dart';

import '../widgets/review_note_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        const Card(
          child: ListTile(
            leading: Icon(Icons.flag_outlined),
            title: Text('Iteration 1 범위'),
            subtitle: Text('로컬 MVP 중심 · 동기화/결제는 설계만 유지'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('약한 리마인드'),
            subtitle: Text('짬시간 시작형 알림(예측 기반)은 다음 단계에서 연결합니다.'),
          ),
        ),
      ],
    );
  }
}
