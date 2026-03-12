import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/session_stats.dart';
import 'models/word_card.dart';
import 'screens/add_screen.dart';
import 'screens/decks_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/today_screen.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentIndex = 0;
  SessionStats _stats = SessionStats.empty;
  final List<WordCard> _cards = [];
  bool _isLoading = true;
  Object? _loadError;

  @override
  void initState() {
    super.initState();
    _bootstrapCards();
  }

  Future<void> _bootstrapCards() async {
    try {
      final cards = await _loadCards();
      if (!mounted) return;
      setState(() {
        _cards
          ..clear()
          ..addAll(cards);
        _isLoading = false;
        _stats = SessionStats(target: 30, completed: 0, known: 0, unsure: 0, again: 0, done: false);
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
    }
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

  void _addCard({
    required String word,
    required String meaningKo,
    required String deck,
    required bool moveToToday,
  }) {
    final nextId = _cards.isEmpty ? 1 : _cards.map((card) => card.id).reduce((a, b) => a > b ? a : b) + 1;
    final newCard = WordCard(
      id: nextId,
      word: word,
      meaningKo: meaningKo,
      exampleEn: '$word example',
      exampleKo: '$meaningKo 예문',
      level: 'custom',
      category: deck,
    );

    setState(() {
      _cards.add(newCard);
      if (moveToToday) {
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
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

    if (_loadError != null) {
      return Scaffold(
        body: Center(
          child: Text('데이터 로드 실패: $_loadError'),
        ),
      );
    }

    final screens = <Widget>[
      TodayScreen(
        cards: _cards,
        onStatsChanged: (s) => setState(() => _stats = s),
      ),
      DecksScreen(
        totalCards: _cards.length,
        customCards: _cards.where((card) => card.level == 'custom').length,
        onStartToday: () => setState(() => _currentIndex = 0),
      ),
      AddScreen(
        key: const ValueKey('add-screen'),
        onAddCard: _addCard,
        onNavigateToday: () => setState(() => _currentIndex = 0),
      ),
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
  }
}
