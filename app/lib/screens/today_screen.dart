import 'package:flutter/material.dart';

import '../models/session_stats.dart';
import '../models/word_card.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({
    super.key,
    required this.cards,
    required this.deckName,
    required this.onStatsChanged,
  });

  final List<WordCard> cards;
  final String deckName;
  final ValueChanged<SessionStats> onStatsChanged;

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int _target = 30;
  int _index = 0;
  int _known = 0;
  int _unsure = 0;
  int _again = 0;
  bool _showMeaning = false;
  double? _dragStartX;
  bool _swipeHandled = false;
  double _nextCardEnterFromX = 0.18;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _emitStats();
      }
    });
  }

  void _emitStats() {
    widget.onStatsChanged(
      SessionStats(
        target: _target,
        completed: _index,
        known: _known,
        unsure: _unsure,
        again: _again,
        done: _index >= _target,
      ),
    );
  }

  void _answer(SessionRating rating) {
    setState(() {
      _nextCardEnterFromX = switch (rating) {
        SessionRating.know => 0.20,
        SessionRating.unsure => 0.0,
        SessionRating.dontKnow => -0.20,
      };

      switch (rating) {
        case SessionRating.know:
          _known++;
        case SessionRating.unsure:
          _unsure++;
        case SessionRating.dontKnow:
          _again++;
      }

      _index++;
      _showMeaning = false;
      _emitStats();
    });
  }

  void _setTarget(int target) {
    setState(() {
      _target = target;
      _index = 0;
      _known = 0;
      _unsure = 0;
      _again = 0;
      _showMeaning = false;
      _emitStats();
    });
  }

  void _resetSession() {
    setState(() {
      _index = 0;
      _known = 0;
      _unsure = 0;
      _again = 0;
      _showMeaning = false;
      _emitStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final done = _index >= _target;
    final word = widget.cards[_index % widget.cards.length];
    final progress = _target == 0 ? 0.0 : (_index / _target).clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        const maxContentWidth = 560.0;
        final contentWidth = constraints.maxWidth > maxContentWidth
            ? maxContentWidth
            : constraints.maxWidth;

        return Center(
          child: SizedBox(
            width: contentWidth,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text('${widget.deckName} · Iteration 1 리뷰 빌드'),
                  const SizedBox(height: 8),
                  Text(
                    '리뷰 포인트: 3단계 평가와 짧은 세션 흐름',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('세션 제어', style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text(
                            done
                                ? '오늘 목표를 완료했습니다. 같은 목표로 다시 시작하거나 목표 수를 바꿀 수 있습니다.'
                                : _index == 0
                                    ? '아직 세션을 시작하지 않았습니다. 목표 카드 수를 고르고 바로 시작하세요.'
                                    : '현재 세션이 진행 중입니다. 목표를 바꾸거나 같은 목표로 다시 시작할 수 있습니다.',
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ChoiceChip(
                                label: const Text('빠른 30카드'),
                                selected: _target == 30,
                                onSelected: (_) => _setTarget(30),
                              ),
                              ChoiceChip(
                                label: const Text('집중 60카드'),
                                selected: _target == 60,
                                onSelected: (_) => _setTarget(60),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: _resetSession,
                            icon: const Icon(Icons.restart_alt),
                            label: const Text('현재 세션 다시 시작'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 8),
                  Text('진행: $_index / $_target · 알겠음 $_known · 헷갈림 $_unsure · 모르겠음 $_again'),
                  const SizedBox(height: 20),
                  if (!done)
                    Expanded(
                      child: GestureDetector(
                        onTapDown: (_) => setState(() => _showMeaning = true),
                        onTapUp: (_) => setState(() => _showMeaning = false),
                        onTapCancel: () => setState(() => _showMeaning = false),
                        onHorizontalDragStart: (details) {
                          _dragStartX = details.globalPosition.dx;
                          _swipeHandled = false;
                        },
                        onHorizontalDragUpdate: (details) {
                          if (_swipeHandled || _dragStartX == null) return;
                          final deltaX = details.globalPosition.dx - _dragStartX!;
                          const swipeThreshold = 24.0;
                          if (deltaX < -swipeThreshold) {
                            _swipeHandled = true;
                            _answer(SessionRating.know);
                          } else if (deltaX > swipeThreshold) {
                            _swipeHandled = true;
                            _answer(SessionRating.dontKnow);
                          }
                        },
                        onHorizontalDragEnd: (_) {
                          _dragStartX = null;
                          _swipeHandled = false;
                          if (_showMeaning && mounted) {
                            setState(() => _showMeaning = false);
                          }
                        },
                        onHorizontalDragCancel: () {
                          _dragStartX = null;
                          _swipeHandled = false;
                          if (_showMeaning && mounted) {
                            setState(() => _showMeaning = false);
                          }
                        },
                        child: TweenAnimationBuilder<Offset>(
                          key: ValueKey(_index),
                          tween: Tween(
                            begin: Offset(_nextCardEnterFromX, 0),
                            end: Offset.zero,
                          ),
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, child) {
                            return FractionalTranslation(
                              translation: value,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 180),
                                opacity: 1,
                                child: child,
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _showMeaning ? word.meaningKo : word.word,
                                      style: Theme.of(context).textTheme.headlineLarge,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      _showMeaning ? word.exampleKo : word.exampleEn,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Spacer(),
                                    Text(
                                      _showMeaning
                                          ? '누르고 있으면 뜻이 보여요'
                                          : '누르고 있으면 뜻이 보여요 · 왼쪽 스와이프: 알겠음 / 오른쪽 스와이프: 모르겠음',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('오늘 목표 달성'),
                                  const SizedBox(height: 8),
                                  Text('알겠음 $_known · 헷갈림 $_unsure · 모르겠음 $_again'),
                                  const SizedBox(height: 12),
                                  FilledButton(
                                    onPressed: () => _setTarget(_target),
                                    child: const Text('다시 시작'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (!done) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _answer(SessionRating.dontKnow),
                            child: const Text('모르겠음'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _answer(SessionRating.unsure),
                            child: const Text('헷갈림'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton(
                            onPressed: () => _answer(SessionRating.know),
                            child: const Text('알겠음'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
