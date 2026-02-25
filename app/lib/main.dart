import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const RepeatoApp());
}

class RepeatoApp extends StatelessWidget {
  const RepeatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repeato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E7D68)),
      ),
      home: const AppRoot(),
    );
  }
}

class WordCard {
  const WordCard({
    required this.id,
    required this.word,
    required this.meaningKo,
    required this.exampleEn,
    required this.exampleKo,
    required this.level,
    required this.category,
  });

  final int id;
  final String word;
  final String meaningKo;
  final String exampleEn;
  final String exampleKo;
  final String level;
  final String category;

  factory WordCard.fromJson(Map<String, dynamic> json) {
    return WordCard(
      id: json['id'] as int,
      word: json['word'] as String,
      meaningKo: json['meaning_ko'] as String,
      exampleEn: json['example_en'] as String,
      exampleKo: json['example_ko'] as String,
      level: json['level'] as String,
      category: json['category'] as String,
    );
  }
}

class SessionStats {
  const SessionStats({
    required this.target,
    required this.completed,
    required this.known,
    required this.again,
    required this.done,
  });

  final int target;
  final int completed;
  final int known;
  final int again;
  final bool done;

  static const empty = SessionStats(
    target: 30,
    completed: 0,
    known: 0,
    again: 0,
    done: false,
  );
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentIndex = 0;
  SessionStats _stats = SessionStats.empty;
  late final Future<List<WordCard>> _cardsFuture;

  @override
  void initState() {
    super.initState();
    _cardsFuture = _loadCards();
  }

  Future<List<WordCard>> _loadCards() async {
    const assetPath = 'assets/data/m2_beginner_words.json';
    debugPrint('[Repeato] loadCards: start ($assetPath)');

    try {
      final raw = await rootBundle
          .loadString(assetPath)
          .timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException('Timed out loading asset: $assetPath');
      });
      debugPrint('[Repeato] loadCards: loaded raw (${raw.length} chars)');

      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      debugPrint('[Repeato] loadCards: decoded list (${decoded.length} items)');

      final cards = decoded
          .map((e) => WordCard.fromJson(e as Map<String, dynamic>))
          .toList();
      debugPrint('[Repeato] loadCards: done (${cards.length} cards)');
      return cards;
    } catch (e, st) {
      debugPrint('[Repeato] loadCards: ERROR $e');
      debugPrint('$st');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordCard>>(
      future: _cardsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(strokeWidth: 4),
                  ),
                  SizedBox(height: 12),
                  Text('Loading…'),
                ],
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('데이터 로드 실패: ${snapshot.error}'),
            ),
          );
        }

        final cards = snapshot.data ?? const <WordCard>[];
        final screens = <Widget>[
          TodayScreen(
            cards: cards,
            onStatsChanged: (s) => setState(() => _stats = s),
          ),
          DecksScreen(totalCards: cards.length),
          const AddScreen(),
          InsightsScreen(stats: _stats),
          const ProfileScreen(),
        ];

        return Scaffold(
          body: SafeArea(child: screens[_currentIndex]),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (i) => setState(() => _currentIndex = i),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Today'),
              NavigationDestination(
                icon: Icon(Icons.collections_bookmark_outlined),
                selectedIcon: Icon(Icons.collections_bookmark),
                label: 'Decks',
              ),
              NavigationDestination(icon: Icon(Icons.add_circle_outline), selectedIcon: Icon(Icons.add_circle), label: 'Add'),
              NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Insights'),
              NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}

class TodayScreen extends StatefulWidget {
  const TodayScreen({
    super.key,
    required this.cards,
    required this.onStatsChanged,
  });

  final List<WordCard> cards;
  final ValueChanged<SessionStats> onStatsChanged;

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int _target = 30;
  int _index = 0;
  int _known = 0;
  int _again = 0;
  bool _showMeaning = false;

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
        again: _again,
        done: _index >= _target,
      ),
    );
  }

  void _answer(bool isKnown) {
    setState(() {
      if (isKnown) {
        _known++;
      } else {
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

    // Make layout responsive: keep content readable on wide screens
    // while still filling the width on phones.
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
                  const Text('중2 초급 영어 · PDF 기반 120단어'),
                  const SizedBox(height: 16),
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
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 8),
                  Text('진행: $_index / $_target · 정답 $_known · 다시보기 $_again'),
                  const SizedBox(height: 20),
                  if (!done)
                    Expanded(
                      child: GestureDetector(
                        // Press-and-hold to reveal the meaning; release to hide.
                        onTapDown: (_) => setState(() => _showMeaning = true),
                        onTapUp: (_) => setState(() => _showMeaning = false),
                        onTapCancel: () => setState(() => _showMeaning = false),
                        // Swipe right = "알고 있음" (known).
                        onHorizontalDragEnd: (details) {
                          final vx = details.velocity.pixelsPerSecond.dx;
                          if (vx > 400) {
                            _answer(true);
                          }
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
                                        : '누르고 있으면 뜻이 보여요 · 오른쪽 스와이프: 알고 있음',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
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
                                  Text('정답 $_known · 다시보기 $_again'),
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
                  if (!done)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _answer(false),
                        child: const Text('다시 보기'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

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
        Card(
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('중2 초급 영어 120'),
            subtitle: Text('카드 $totalCards개 · 소스: 중등 수능필수영단어 1800.pdf'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Add', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.upload_file),
            title: Text('콘텐츠 패키지 추가(다음 단계)'),
            subtitle: Text('PDF/CSV 기반 신규 암기 콘텐츠를 같은 앱 구조에 연결할 예정입니다.'),
          ),
        ),
      ],
    );
  }
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key, required this.stats});

  final SessionStats stats;

  @override
  Widget build(BuildContext context) {
    final solved = (stats.known + stats.again);
    final accuracy = solved == 0 ? 0 : ((stats.known / solved) * 100).round();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Insights', style: Theme.of(context).textTheme.headlineMedium),
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
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
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
